import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../data/category_repository.dart';
import '../models/category.dart';
import '../services/import_export_service.dart';

class CategoryEditorScreen extends StatefulWidget {
  final Category? category;
  final CategoryRepository repo;

  const CategoryEditorScreen({super.key, this.category, required this.repo});

  @override
  State<CategoryEditorScreen> createState() => _CategoryEditorScreenState();
}

class _CategoryEditorScreenState extends State<CategoryEditorScreen> {
  late final TextEditingController _nameController;
  late List<String> _words;
  late bool _isPreset;
  late bool _isNew;
  final List<TextEditingController> _wordControllers = [];
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final cat = widget.category;
    _isNew = cat == null;
    _isPreset = cat?.isPreset ?? false;
    _nameController = TextEditingController(text: cat?.name ?? '');
    _words = List.from(cat?.words ?? []);
    for (final w in _words) {
      _wordControllers.add(TextEditingController(text: w));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (final c in _wordControllers) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _addWord() async {
    final controller = TextEditingController();
    final word = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A237E),
        title: const Text('Add Word', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Enter word',
            hintStyle: TextStyle(color: Colors.white38),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
          ),
          onSubmitted: (v) => Navigator.pop(ctx, v.trim()),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Add', style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
      ),
    );
    if (word != null && word.isNotEmpty) {
      setState(() {
        _words.insert(0, word);
        _wordControllers.insert(0, TextEditingController(text: word));
      });
    }
  }

  void _removeWord(int index) {
    setState(() {
      _words.removeAt(index);
      _wordControllers[index].dispose();
      _wordControllers.removeAt(index);
    });
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category name cannot be empty')),
      );
      return;
    }

    final words = _wordControllers
        .map((c) => c.text.trim())
        .where((w) => w.isNotEmpty)
        .toList();

    if (words.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least one word')),
      );
      return;
    }

    setState(() => _saving = true);

    final category = Category(
      id: widget.category?.id ?? const Uuid().v4(),
      name: name,
      words: words,
      isPreset: _isPreset,
    );

    await widget.repo.save(category);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _export() async {
    final name = _nameController.text.trim().isEmpty
        ? widget.category!.name
        : _nameController.text.trim();
    final words = _wordControllers.map((c) => c.text.trim()).where((w) => w.isNotEmpty).toList();
    final category = Category(
      id: widget.category!.id,
      name: name,
      words: words,
      isPreset: _isPreset,
    );
    try {
      final filename = '${name.toLowerCase().replaceAll(' ', '_')}.json';
      await ImportExportService.export([category], filename);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Export failed: $e')));
      }
    }
  }

  Future<void> _restoreDefaults() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restore Defaults'),
        content: const Text('This will remove all your changes to this category and restore the original word list. Are you sure?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restore', style: TextStyle(color: Colors.orangeAccent)),
          ),
        ],
      ),
    );
    if (confirm == true && mounted) {
      await widget.repo.resetPresetOverride(widget.category!.id);
      if (mounted) Navigator.of(context).pop();
    }
  }

  Future<void> _delete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Category'),
        content: const Text('Are you sure you want to delete this category?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true && mounted) {
      await widget.repo.deleteCustomCategory(widget.category!.id);
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1333),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A237E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          _isNew ? 'New Category' : 'Edit Category',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (!_isNew)
            IconButton(
              icon: const Icon(Icons.download, color: Colors.white70),
              tooltip: 'Export this category',
              onPressed: _export,
            ),
          if (!_isNew && _isPreset)
            IconButton(
              icon: const Icon(Icons.restore, color: Colors.orangeAccent),
              tooltip: 'Restore defaults',
              onPressed: _restoreDefaults,
            ),
          if (!_isNew && !_isPreset)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: _delete,
            ),
          IconButton(
            icon: _saving
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Icon(Icons.check, color: Colors.white),
            onPressed: _saving ? null : _save,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: 'Category Name',
                labelStyle: const TextStyle(color: Colors.white54),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                filled: true,
                fillColor: Colors.white10,
                hintText: _isPreset ? 'Preset category' : 'Enter category name',
                hintStyle: const TextStyle(color: Colors.white30),
              ),
            ),
          ),
          const Divider(color: Colors.white12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('WORDS', style: TextStyle(color: Colors.white54, letterSpacing: 3, fontSize: 13)),
                TextButton.icon(
                  icon: const Icon(Icons.add, color: Colors.blueAccent),
                  label: const Text('Add Word', style: TextStyle(color: Colors.blueAccent)),
                  onPressed: _addWord,
                ),
              ],
            ),
          ),
          Expanded(
            child: _wordControllers.isEmpty
                ? const Center(child: Text('No words yet. Add some!', style: TextStyle(color: Colors.white38)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _wordControllers.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _wordControllers[i],
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: 'Word ${i + 1}',
                                  hintStyle: const TextStyle(color: Colors.white30),
                                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                              onPressed: () => _removeWord(i),
                            ),
                          ],
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
