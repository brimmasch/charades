class WordResult {
  final String word;
  final bool gotIt;

  const WordResult({required this.word, required this.gotIt});

  Map<String, dynamic> toJson() => {'word': word, 'gotIt': gotIt};

  factory WordResult.fromJson(Map<String, dynamic> json) =>
      WordResult(word: json['word'] as String, gotIt: json['gotIt'] as bool);
}
