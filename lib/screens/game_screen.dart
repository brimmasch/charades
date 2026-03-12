import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../models/category.dart';
import '../models/word_result.dart';
import '../models/game_history_entry.dart';
import '../services/history_service.dart';
import '../services/sensor_service.dart';
import 'results_screen.dart';

enum _FlashState { none, gotIt, passed }

class GameScreen extends StatefulWidget {
  final Category category;
  final List<String> shuffledWords;
  final int gameDuration;

  const GameScreen({
    super.key,
    required this.category,
    required this.shuffledWords,
    this.gameDuration = 60,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const double _g = 9.81;
  static const double _tol20 = _g * 0.2; // ≈ 1.96 — used for neutral/horizontal
  static const double _tol30 = _g * 0.3; // ≈ 2.94 — used for GOT IT / PASS

  late List<String> _words;
  int _wordIndex = 0;
  late int _secondsLeft;
  int _score = 0;

  final List<WordResult> _results = [];
  _FlashState _flash = _FlashState.none;
  bool _seenNeutral = true;

  Timer? _gameTimer;
  StreamSubscription<AccelSample>? _tiltSub;

  // Horizontal: |X|≈9.81, Y≈0, Z≈0 (20% tolerance) — handles both landscape orientations
  bool _isHorizontal(AccelSample s) =>
      s.x.abs() > (_g - _tol20) && s.y.abs() < _tol20 && s.z.abs() < _tol20;

  // GOT IT: X≈0, Y≈0, Z≈-9.81 (forward tilt, 30% tolerance)
  bool _isGotIt(AccelSample s) =>
      s.x.abs() < _tol30 && s.y.abs() < _tol30 && s.z < -(_g - _tol30);

  // PASS: X≈0, Y≈0, Z≈+9.81 (backward tilt, 30% tolerance)
  bool _isPass(AccelSample s) =>
      s.x.abs() < _tol30 && s.y.abs() < _tol30 && s.z > (_g - _tol30);

  @override
  void initState() {
    super.initState();
    _words = List.from(widget.shuffledWords);
    _secondsLeft = widget.gameDuration;
    if (!kIsWeb) {
      WakelockPlus.enable().catchError((_) {});
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    _startGame();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    _tiltSub?.cancel();
    if (!kIsWeb) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      WakelockPlus.disable().catchError((_) {});
    }
    super.dispose();
  }

  void _startGame() {
    _startTimer();
    _subscribeTilt();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_secondsLeft <= 1) {
        _gameTimer?.cancel();
        _endGame();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _subscribeTilt() {
    if (kIsWeb) return;
    _tiltSub = SensorService.accelStream.listen((s) {
      if (_flash != _FlashState.none) {
        if (_isHorizontal(s)) _seenNeutral = true;
        return;
      }
      if (!_seenNeutral) {
        if (_isHorizontal(s)) _seenNeutral = true;
        return;
      }
      if (_isGotIt(s)) {
        _handleGotIt();
      } else if (_isPass(s)) {
        _handlePass();
      }
    });
  }

  String get _currentWord => _words[_wordIndex % _words.length];

  void _handleGotIt() {
    if (_flash != _FlashState.none) return;
    _seenNeutral = false;
    _results.add(WordResult(word: _currentWord, gotIt: true));
    setState(() { _flash = _FlashState.gotIt; _score++; });
    _advanceWord();
  }

  void _handlePass() {
    if (_flash != _FlashState.none) return;
    _seenNeutral = false;
    _results.add(WordResult(word: _currentWord, gotIt: false));
    setState(() => _flash = _FlashState.passed);
    _advanceWord();
  }

  void _advanceWord() {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      _wordIndex++;
      if (_wordIndex >= _words.length) {
        _words.shuffle();
        _wordIndex = 0;
      }
      setState(() => _flash = _FlashState.none);
    });
  }

  void _endGame() async {
    if (!mounted) return;
    final entry = GameHistoryEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateTime: DateTime.now(),
      categoryName: widget.category.name,
      results: List.from(_results),
      gameDuration: widget.gameDuration,
    );
    await HistoryService.saveEntry(entry);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultsScreen(
          category: widget.category,
          results: _results,
          score: _score,
          gameDuration: widget.gameDuration,
        ),
      ),
    );
  }

  Color get _flashColor {
    switch (_flash) {
      case _FlashState.gotIt: return Colors.green;
      case _FlashState.passed: return Colors.red;
      case _FlashState.none: return Colors.transparent;
    }
  }

  String get _flashLabel {
    switch (_flash) {
      case _FlashState.gotIt: return 'GOT IT!';
      case _FlashState.passed: return 'PASSED';
      case _FlashState.none: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFlashing = _flash != _FlashState.none;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          color: isFlashing ? _flashColor : const Color(0xFF0D1333),
          child: SafeArea(
            child: Stack(
              children: [
                // Timer bar at top
                Positioned(
                  top: 0, left: 0, right: 0,
                  child: LinearProgressIndicator(
                    value: _secondsLeft / widget.gameDuration,
                    minHeight: 8,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _secondsLeft > 15 ? Colors.greenAccent : Colors.redAccent,
                    ),
                  ),
                ),

                // Timer text
                Positioned(
                  top: 12, right: 16,
                  child: Text(
                    '$_secondsLeft',
                    style: TextStyle(
                      color: _secondsLeft > 15 ? Colors.white54 : Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Main content
                Center(
                  child: isFlashing
                      ? Text(
                          _flashLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                          ),
                        )
                      : Text(
                          _currentWord,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                ),

                // Score at bottom
                Positioned(
                  bottom: 16, left: 0, right: 0,
                  child: Column(
                    children: [
                      Text(
                        'Score: $_score',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (kIsWeb) ...[
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                              ),
                              onPressed: _flash == _FlashState.none ? _handleGotIt : null,
                              child: const Text('GOT IT ✓', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                              ),
                              onPressed: _flash == _FlashState.none ? _handlePass : null,
                              child: const Text('PASS ✗', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
