class Category {
  final String id;
  String name;
  List<String> words;
  final bool isPreset;

  Category({
    required this.id,
    required this.name,
    required this.words,
    this.isPreset = false,
  });

  Category copyWith({String? name, List<String>? words}) => Category(
        id: id,
        name: name ?? this.name,
        words: words ?? List.from(this.words),
        isPreset: isPreset,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'words': words,
        'isPreset': isPreset,
      };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        name: json['name'] as String,
        words: List<String>.from(json['words'] as List),
        isPreset: json['isPreset'] as bool? ?? false,
      );
}
