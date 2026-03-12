import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_history_entry.dart';

class HistoryService {
  static const String _key = 'game_history';
  static const int _maxEntries = 50;

  static Future<List<GameHistoryEntry>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List<dynamic>;
    return list
        .map((e) => GameHistoryEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<void> saveEntry(GameHistoryEntry entry) async {
    final entries = await loadAll();
    entries.insert(0, entry);
    if (entries.length > _maxEntries) entries.removeRange(_maxEntries, entries.length);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(entries.map((e) => e.toJson()).toList()));
  }

  static Future<void> deleteEntry(String id) async {
    final entries = await loadAll();
    entries.removeWhere((e) => e.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(entries.map((e) => e.toJson()).toList()));
  }
}
