class Word {
  final String word;
  final String translation;
  final String category;
  final String? example;
  final String? pronunciation;

  Word({
    required this.word,
    required this.translation,
    required this.category,
    this.example,
    this.pronunciation,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String,
      translation: json['translation'] as String,
      category: json['category'] as String,
      example: json['example'] as String?,
      pronunciation: json['pronunciation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'translation': translation,
      'category': category,
      'example': example,
      'pronunciation': pronunciation,
    };
  }
}