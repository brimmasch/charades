import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/sensor_service.dart';
import 'game_screen.dart';

class GameStartScreen extends StatefulWidget {
  final Category category;
  final int gameDuration;

  const GameStartScreen({super.key, required this.category, this.gameDuration = 60});

  @override
  State<GameStartScreen> createState() => _GameStartScreenState();
}

class _GameStartScreenState extends State<GameStartScreen> {
  StreamSubscription<AccelSample>? _accelSub;
  Timer? _horizontalDebounce;
  bool _isHorizontal = false;
  bool _countingDown = false;
  int _countdown = 3;
  List<String> _shuffledWords = [];

  static const double _g = 9.81;
  static const double _tol = _g * 0.2; // ≈ 1.96

  bool _checkHorizontal(AccelSample s) =>
      s.x.abs() > (_g - _tol) && s.y.abs() < _tol && s.z.abs() < _tol;

  @override
  void initState() {
    super.initState();
    _shuffledWords = List.from(widget.category.words)..shuffle();
    if (!kIsWeb) {
      _accelSub = SensorService.accelStream.listen((s) {
        // Once counting down, ignore further orientation changes.
        if (_countingDown) return;

        if (_checkHorizontal(s)) {
          // Start debounce — only trigger after 400ms sustained horizontal.
          _horizontalDebounce ??= Timer(const Duration(milliseconds: 400), () {
            if (mounted && !_countingDown) {
              setState(() => _isHorizontal = true);
              _startCountdown();
            }
          });
        } else {
          // Phone moved away — cancel any pending debounce and revert.
          _horizontalDebounce?.cancel();
          _horizontalDebounce = null;
          if (_isHorizontal && mounted) {
            setState(() => _isHorizontal = false);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _accelSub?.cancel();
    _horizontalDebounce?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    setState(() { _countingDown = true; _countdown = 3; });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) { timer.cancel(); return; }
      if (_countdown <= 1) {
        timer.cancel();
        _launchGame();
      } else {
        setState(() => _countdown--);
      }
    });
  }

  void _launchGame() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => GameScreen(
          category: widget.category,
          shuffledWords: _shuffledWords,
          gameDuration: widget.gameDuration,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1333),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.category.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: !kIsWeb && !_isHorizontal
              ? _buildWaitForHorizontal()
              : _countingDown
                  ? _buildCountdown()
                  : _buildWaiting(),
        ),
      ),
    );
  }

  Widget _buildWaitForHorizontal() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.screen_rotation, color: Colors.white54, size: 80),
        SizedBox(height: 24),
        Text(
          'Hold the phone to your forehead.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 22, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildCountdown() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        '$_countdown',
        key: ValueKey(_countdown),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 160,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildWaiting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 80),
        const SizedBox(height: 24),
        const Text(
          'GET READY!',
          style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 4),
        ),
        const SizedBox(height: 16),
        Text(
          kIsWeb ? 'Press Start when you\'re ready!' : 'Hold the phone against your forehead\nto begin the countdown.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 18, height: 1.5),
        ),
        const SizedBox(height: 48),
        if (kIsWeb)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            icon: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
            label: const Text('START', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            onPressed: _startCountdown,
          )
        else
          const Column(
            children: [
              Icon(Icons.smartphone, color: Colors.white54, size: 64),
              SizedBox(height: 12),
              Text('📱 → 🤔', style: TextStyle(fontSize: 40)),
            ],
          ),
      ],
    );
  }
}
