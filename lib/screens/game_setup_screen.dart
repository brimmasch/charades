import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/category.dart';
import 'game_start_screen.dart';

class GameSetupScreen extends StatefulWidget {
  final Category category;

  const GameSetupScreen({super.key, required this.category});

  @override
  State<GameSetupScreen> createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends State<GameSetupScreen> {
  static const String _prefKey = 'game_duration';
  int _duration = 60; // seconds

  @override
  void initState() {
    super.initState();
    _loadDuration();
  }

  Future<void> _loadDuration() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getInt(_prefKey);
    if (saved != null && mounted) {
      setState(() => _duration = saved);
    }
  }

  Future<void> _setDuration(int value) async {
    setState(() => _duration = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefKey, value);
  }

  void _startGame() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GameStartScreen(
          category: widget.category,
          gameDuration: _duration,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Game Duration',
              style: TextStyle(color: Colors.white70, fontSize: 20, letterSpacing: 2),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _duration > 15
                      ? () => _setDuration(_duration - 15)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Colors.white,
                  disabledColor: Colors.white24,
                  iconSize: 56,
                ),
                Expanded(
                  child: Text(
                    '$_duration s',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _duration < 180
                      ? () => _setDuration(_duration + 15)
                      : null,
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.white,
                  disabledColor: Colors.white24,
                  iconSize: 56,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.play_arrow, color: Colors.white, size: 28),
                label: const Text(
                  'START',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                onPressed: _startGame,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
