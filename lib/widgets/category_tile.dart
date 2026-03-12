import 'package:flutter/material.dart';
import '../models/category.dart';

const List<Color> _tileColors = [
  Color(0xFF1565C0), // blue
  Color(0xFF2E7D32), // green
  Color(0xFFE65100), // orange
  Color(0xFF6A1B9A), // purple
  Color(0xFFC62828), // red
  Color(0xFF00695C), // teal
  Color(0xFFAD1457), // pink
  Color(0xFFF57F17), // amber
];

class CategoryTile extends StatelessWidget {
  final Category category;
  final int index;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const CategoryTile({
    super.key,
    required this.category,
    required this.index,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final color = _tileColors[index % _tileColors.length];

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(100),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${category.words.length} words',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
