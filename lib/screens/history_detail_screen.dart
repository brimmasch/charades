import 'package:flutter/material.dart';
import '../models/game_history_entry.dart';

class HistoryDetailScreen extends StatelessWidget {
  final GameHistoryEntry entry;

  const HistoryDetailScreen({super.key, required this.entry});

  String _formatDuration(int seconds) {
    if (seconds < 60) return '$seconds sec';
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return s == 0 ? '$m min' : '$m min $s sec';
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = dt.hour < 12 ? 'AM' : 'PM';
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}  $hour:$minute $ampm';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1333),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A237E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          entry.categoryName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Score header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: const Color(0xFF1A237E),
            child: Column(
              children: [
                Text(
                  _formatDate(entry.dateTime),
                  style: const TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 1),
                ),
                const SizedBox(height: 8),
                const Text('FINAL SCORE', style: TextStyle(color: Colors.white60, fontSize: 16, letterSpacing: 3)),
                const SizedBox(height: 8),
                Text(
                  '${entry.score}',
                  style: const TextStyle(color: Colors.white, fontSize: 72, fontWeight: FontWeight.w900),
                ),
                Text(
                  '${entry.score} of ${entry.results.length} words',
                  style: const TextStyle(color: Colors.white60, fontSize: 15),
                ),
                if (entry.gameDuration != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _formatDuration(entry.gameDuration!),
                    style: const TextStyle(color: Colors.white38, fontSize: 13),
                  ),
                ],
              ],
            ),
          ),

          // Word list
          Expanded(
            child: entry.results.isEmpty
                ? const Center(child: Text('No words played!', style: TextStyle(color: Colors.white54, fontSize: 18)))
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    itemCount: entry.results.length,
                    separatorBuilder: (_, __) => const Divider(color: Colors.white12, height: 1),
                    itemBuilder: (context, i) {
                      final result = entry.results[i];
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
        ],
      ),
    );
  }
}
