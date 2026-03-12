import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/word_result.dart';
import 'game_setup_screen.dart';

class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
    );
  }
}

String _formatDuration(int seconds) {
  if (seconds < 60) return '$seconds sec';
  final m = seconds ~/ 60;
  final s = seconds % 60;
  return s == 0 ? '$m min' : '$m min $s sec';
}

class ResultsScreen extends StatelessWidget {
  final Category category;
  final List<WordResult> results;
  final int score;
  final int? gameDuration;

  const ResultsScreen({
    super.key,
    required this.category,
    required this.results,
    required this.score,
    this.gameDuration,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D1333),
        body: SafeArea(
          child: Column(
            children: [
              // Score header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: isLandscape ? 8 : 24),
                color: const Color(0xFF1A237E),
                child: isLandscape
                    ? Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: _InfoChip(
                                '${results.where((r) => r.gotIt).length} of ${results.length} words',
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('FINAL SCORE', style: TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 3)),
                              Text('$score', style: const TextStyle(color: Colors.white, fontSize: 52, fontWeight: FontWeight.w900)),
                            ],
                          ),
                          Expanded(
                            child: Center(
                              child: gameDuration != null
                                  ? _InfoChip(_formatDuration(gameDuration!))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Text('FINAL SCORE', style: TextStyle(color: Colors.white60, fontSize: 16, letterSpacing: 3)),
                          const SizedBox(height: 8),
                          Text('$score', style: const TextStyle(color: Colors.white, fontSize: 72, fontWeight: FontWeight.w900)),
                          Text(
                            '${results.where((r) => r.gotIt).length} of ${results.length} words',
                            style: const TextStyle(color: Colors.white60, fontSize: 15),
                          ),
                          if (gameDuration != null) ...[
                            const SizedBox(height: 4),
                            Text(_formatDuration(gameDuration!), style: const TextStyle(color: Colors.white38, fontSize: 13)),
                          ],
                        ],
                      ),
              ),

              // Word list
              Expanded(
                child: results.isEmpty
                    ? const Center(child: Text('No words played!', style: TextStyle(color: Colors.white54, fontSize: 18)))
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        itemCount: results.length,
                        separatorBuilder: (context, index) => const Divider(color: Colors.white12, height: 1),
                        itemBuilder: (context, i) {
                          final result = results[i];
                          return ListTile(
                            dense: true,
                            leading: Icon(
                              result.gotIt ? Icons.check_circle : Icons.cancel,
                              color: result.gotIt ? Colors.greenAccent : Colors.redAccent,
                            ),
                            title: Text(
                              result.word,
                              style: TextStyle(
                                color: result.gotIt ? Colors.white : Colors.white38,
                                fontSize: 20,
                                fontWeight: result.gotIt ? FontWeight.bold : FontWeight.normal,
                                decoration: result.gotIt ? null : TextDecoration.lineThrough,
                                decorationColor: Colors.white38,
                              ),
                            ),
                            trailing: Text(
                              result.gotIt ? '+1' : '',
                              style: const TextStyle(color: Colors.greenAccent, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
              ),

              // Score footer + buttons
              Container(
                padding: EdgeInsets.all(isLandscape ? 12 : 20),
                color: const Color(0xFF1A237E),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white54),
                              padding: EdgeInsets.symmetric(vertical: isLandscape ? 8 : 14),
                            ),
                            icon: const Icon(Icons.grid_view, color: Colors.white70),
                            label: const Text('Categories', style: TextStyle(color: Colors.white70, fontSize: 16)),
                            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/categories', (_) => false),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              padding: EdgeInsets.symmetric(vertical: isLandscape ? 8 : 14),
                            ),
                            icon: const Icon(Icons.replay, color: Colors.black87),
                            label: const Text('Play Again', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                            onPressed: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => GameSetupScreen(category: category)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
