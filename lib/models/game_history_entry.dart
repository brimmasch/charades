import 'word_result.dart';

class GameHistoryEntry {
  final String id;
  final DateTime dateTime;
  final String categoryName;
  final List<WordResult> results;
  final int? gameDuration; // seconds; nullable for backward compat

  const GameHistoryEntry({
    required this.id,
    required this.dateTime,
    required this.categoryName,
    required this.results,
    this.gameDuration,
  });

  int get score => results.where((r) => r.gotIt).length;

  Map<String, dynamic> toJson() => {
    'id': id,
    'dateTime': dateTime.toIso8601String(),
    'categoryName': categoryName,
    'results': results.map((r) => r.toJson()).toList(),
    if (gameDuration != null) 'gameDuration': gameDuration,
  };

  factory GameHistoryEntry.fromJson(Map<String, dynamic> json) => GameHistoryEntry(
    id: json['id'] as String,
    dateTime: DateTime.parse(json['dateTime'] as String),
    categoryName: json['categoryName'] as String,
    results: (json['results'] as List<dynamic>)
        .map((r) => WordResult.fromJson(r as Map<String, dynamic>))
        .toList(),
    gameDuration: json['gameDuration'] as int?,
  );
}
