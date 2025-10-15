class VocabRepository {
  Future<List<Map<String, dynamic>>> getVocabulary(String language) async {
    // Mock data - bu yerda API call bo'lishi mumkin
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      {'word': 'Hello', 'translation': 'Hola', 'category': 'greetings'},
      {'word': 'Goodbye', 'translation': 'Adiós', 'category': 'greetings'},
      {'word': 'Thank you', 'translation': 'Gracias', 'category': 'common'},
    ];
  }
}