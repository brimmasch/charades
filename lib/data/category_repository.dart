import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/category.dart';
import 'preset_categories.dart';

class CategoryRepository {
  static const _customKey = 'charades_custom_categories';
  static const _overridesKey = 'charades_preset_overrides';

  Future<List<Category>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();

    // Load preset overrides (only name changes + user-added/removed words).
    final overridesJson = prefs.getString(_overridesKey);
    final Map<String, dynamic> overrides = overridesJson != null
        ? (jsonDecode(overridesJson) as Map<String, dynamic>)
        : {};

    // Apply overrides to presets.
    // Word list = union of source words + any user-added words, minus any
    // user-explicitly-removed words. This means updates to source presets
    // always surface even if an old override exists.
    final List<Category> categories = presetCategories.map((preset) {
      if (!overrides.containsKey(preset.id)) return preset;

      final o = overrides[preset.id] as Map<String, dynamic>;
      final overrideName = o['name'] as String? ?? preset.name;

      // Extra words the user added beyond what was in source at save time.
      final added = List<String>.from(o['added'] as List? ?? []);
      // Words the user explicitly removed from the source.
      final removed = Set<String>.from(o['removed'] as List? ?? []);

      // Merge: start from current source, apply removals, append any additions.
      final merged = [
        ...preset.words.where((w) => !removed.contains(w)),
        ...added.where((w) => !preset.words.contains(w)),
      ];

      return Category(
        id: preset.id,
        name: overrideName,
        words: merged,
        isPreset: true,
      );
    }).toList();

    // Load custom categories.
    final customJson = prefs.getString(_customKey);
    if (customJson != null) {
      try {
        final List<dynamic> list = jsonDecode(customJson) as List<dynamic>;
        for (final item in list) {
          categories.add(Category.fromJson(item as Map<String, dynamic>));
        }
      } catch (_) {}
    }

    return categories;
  }

  Future<void> saveCustomCategory(Category category) async {
    final prefs = await SharedPreferences.getInstance();
    final all = await loadAll();
    final custom = all.where((c) => !c.isPreset).toList();

    final idx = custom.indexWhere((c) => c.id == category.id);
    if (idx >= 0) {
      custom[idx] = category;
    } else {
      custom.add(category);
    }

    await prefs.setString(_customKey, jsonEncode(custom.map((c) => c.toJson()).toList()));
  }

  Future<void> updatePresetOverride(Category edited) async {
    final prefs = await SharedPreferences.getInstance();

    // Find the original source preset so we can compute the diff.
    final source = presetCategories.firstWhere((p) => p.id == edited.id);
    final sourceWords = source.words.toSet();
    final editedWords = edited.words.toSet();

    final added = editedWords.difference(sourceWords).toList();
    final removed = sourceWords.difference(editedWords).toList();

    final overridesJson = prefs.getString(_overridesKey);
    final Map<String, dynamic> overrides = overridesJson != null
        ? (jsonDecode(overridesJson) as Map<String, dynamic>)
        : {};

    overrides[edited.id] = {
      'name': edited.name,
      'added': added,
      'removed': removed,
    };

    await prefs.setString(_overridesKey, jsonEncode(overrides));
  }

  Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_customKey);
    await prefs.remove(_overridesKey);
  }

  Future<void> resetPresetOverride(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final overridesJson = prefs.getString(_overridesKey);
    if (overridesJson == null) return;
    final Map<String, dynamic> overrides = Map.from(jsonDecode(overridesJson) as Map);
    overrides.remove(id);
    await prefs.setString(_overridesKey, jsonEncode(overrides));
  }

  Future<void> deleteCustomCategory(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final all = await loadAll();
    final custom = all.where((c) => !c.isPreset && c.id != id).toList();
    await prefs.setString(_customKey, jsonEncode(custom.map((c) => c.toJson()).toList()));
  }

  Future<void> save(Category category) async {
    if (category.isPreset) {
      await updatePresetOverride(category);
    } else {
      await saveCustomCategory(category);
    }
  }
}
