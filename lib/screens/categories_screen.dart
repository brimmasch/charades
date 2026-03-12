import 'package:flutter/material.dart';
import '../data/category_repository.dart';
import '../models/category.dart';
import '../models/game_history_entry.dart';
import '../services/history_service.dart';
import '../services/import_export_service.dart';
import '../widgets/category_tile.dart';
import 'category_editor_screen.dart';
import 'history_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _repo = CategoryRepository();
  List<Category> _categories = [];
  List<GameHistoryEntry> _history = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final cats = await _repo.loadAll();
    final history = await HistoryService.loadAll();
    if (mounted) setState(() { _categories = cats; _history = history; _loading = false; });
  }

  Future<void> _openEditor(Category? category) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryEditorScreen(category: category, repo: _repo),
      ),
    );
    _load();
  }

  Future<void> _resetAll() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset All Defaults'),
        content: const Text(
          'This will permanently delete all custom categories and revert every preset to its original word list. This cannot be undone.\n\nAre you sure?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset All', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _repo.resetAll();
    _load();
  }

  Future<void> _exportAll() async {
    if (!mounted) return;

    final choice = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Export Categories'),
        content: const Text('Which categories would you like to export?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, 'custom'), child: const Text('Custom only')),
          TextButton(onPressed: () => Navigator.pop(ctx, 'presets'), child: const Text('Presets only')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, 'all'), child: const Text('All')),
        ],
      ),
    );

    if (choice == null) return;

    final List<Category> toExport;
    final String filename;
    if (choice == 'custom') {
      toExport = _categories.where((c) => !c.isPreset).toList();
      filename = 'charades_custom.json';
    } else if (choice == 'presets') {
      toExport = _categories.where((c) => c.isPreset).toList();
      filename = 'charades_presets.json';
    } else {
      toExport = _categories;
      filename = 'charades_categories.json';
    }

    if (toExport.isEmpty) {
      _showSnack('No categories to export.');
      return;
    }

    try {
      await ImportExportService.export(toExport, filename);
    } catch (e) {
      _showSnack('Export failed: $e');
    }
  }

  Future<void> _import() async {
    List<Category>? imported;
    try {
      imported = await ImportExportService.import();
    } catch (e) {
      _showSnack('Could not read file: $e');
      return;
    }

    if (imported == null) return; // User cancelled.

    if (imported.isEmpty) {
      _showSnack('No categories found in file.');
      return;
    }

    if (!mounted) return;

    // Match each imported category against an existing one by ID.
    final existingById = { for (final c in _categories) c.id: c };
    final replacing = <Category>[];
    final adding = <Category>[];
    for (final cat in imported) {
      if (existingById.containsKey(cat.id)) {
        replacing.add(cat);
      } else {
        adding.add(cat);
      }
    }

    // Build confirmation message.
    final buffer = StringBuffer();
    if (replacing.isNotEmpty) {
      buffer.writeln('The following will be REPLACED (words included/excluded will match the backup):');
      for (final c in replacing) {
        buffer.writeln('  • ${c.name} (${c.words.length} words)');
      }
    }
    if (adding.isNotEmpty) {
      if (buffer.isNotEmpty) buffer.writeln();
      buffer.writeln('The following will be ADDED as new:');
      for (final c in adding) {
        buffer.writeln('  • ${c.name} (${c.words.length} words)');
      }
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import Categories'),
        content: SingleChildScrollView(child: Text(buffer.toString().trim())),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Import')),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    for (final cat in imported) {
      if (cat.isPreset) {
        // Apply the imported word list as a preset override — this correctly
        // restores any words the user removed before exporting.
        await _repo.updatePresetOverride(cat);
      } else {
        // Custom category: upsert by ID (replaces if same ID exists).
        await _repo.saveCustomCategory(cat);
      }
    }

    final total = imported.length;
    _showSnack('Imported $total ${total == 1 ? 'category' : 'categories'}.');
    _load();
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1333),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(224),
        child: AppBar(
          backgroundColor: const Color(0xFF1A237E),
          toolbarHeight: 224,
          elevation: 0,
          centerTitle: true,
          title: GestureDetector(
            onLongPress: _resetAll,
            child: const Text(
              'CHARADES',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 4,
                fontWeight: FontWeight.w900,
                fontSize: 48,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.upload_file, color: Colors.white),
              tooltip: 'Import categories',
              onPressed: _import,
            ),
            IconButton(
              icon: const Icon(Icons.download, color: Colors.white),
              tooltip: 'Export categories',
              onPressed: _exportAll,
            ),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final cat = _categories[i];
                        return CategoryTile(
                          category: cat,
                          index: i,
                          onTap: () => Navigator.of(context).pushNamed('/game-start', arguments: cat),
                          onLongPress: () => _openEditor(cat),
                        );
                      },
                      childCount: _categories.length,
                    ),
                  ),
                ),
                if (_history.isNotEmpty) ...[
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'RECENT GAMES',
                        style: TextStyle(color: Colors.white38, fontSize: 12, letterSpacing: 3),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => _HistoryTile(
                        entry: _history[i],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HistoryDetailScreen(entry: _history[i])),
                        ),
                        onLongPress: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Delete Game'),
                              content: const Text('Remove this game from history?'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            await HistoryService.deleteEntry(_history[i].id);
                            _load();
                          }
                        },
                      ),
                      childCount: _history.length,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1A237E),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Category', style: TextStyle(color: Colors.white)),
        onPressed: () => _openEditor(null),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final GameHistoryEntry entry;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _HistoryTile({required this.entry, required this.onTap, required this.onLongPress});

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = dt.hour < 12 ? 'AM' : 'PM';
    return '${months[dt.month - 1]} ${dt.day}  $hour:$minute $ampm';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.history, color: Colors.white38, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.categoryName,
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _formatDate(entry.dateTime),
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              '${entry.score} / ${entry.results.length}',
              style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.white24, size: 20),
          ],
        ),
      ),
    );
  }
}
