import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/category.dart';
import 'platform_file_service.dart';

class ImportExportService {
  static String encodeCategories(List<Category> categories) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(categories.map((c) => c.toJson()).toList());
  }

  static List<Category> decodeCategories(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      // Preserve isPreset and id so the caller can match against existing
      // categories and route to the correct save method.
      return Category.fromJson(map);
    }).toList();
  }

  /// Export [categories] to a file. On web this triggers a browser download;
  /// on mobile it opens the system share sheet with a .json file attachment.
  static Future<void> export(List<Category> categories, String filename) async {
    final json = encodeCategories(categories);

    if (kIsWeb) {
      await triggerWebDownload(json, filename);
      return;
    }

    // Mobile: write to a temp file then share it.
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsString(json);
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'application/json')],
      subject: 'Charades categories',
    );
  }

  /// Pick a .json file and return the parsed categories.
  /// Returns null if the user cancelled or the file was invalid.
  static Future<List<Category>?> import() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );

    if (result == null || result.files.isEmpty) return null;

    final file = result.files.first;
    final String raw;

    if (kIsWeb) {
      // On web, file bytes are available directly.
      final bytes = file.bytes;
      if (bytes == null) return null;
      raw = utf8.decode(bytes);
    } else {
      final path = file.path;
      if (path == null) return null;
      raw = await File(path).readAsString();
    }

    try {
      return decodeCategories(raw);
    } catch (_) {
      return null; // Caller shows an error message.
    }
  }
}
