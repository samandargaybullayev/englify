import 'package:flutter/material.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key, required this.onBack, required this.selectedLanguage, required this.interfaceLanguage});
  final VoidCallback onBack;
  final String selectedLanguage;
  final String interfaceLanguage;

  @override
  Widget build(BuildContext context) => Column(children: [
    const SizedBox(height: 16),
    Text('Vocabulary ($selectedLanguage)', style: Theme.of(context).textTheme.headlineSmall),
    const SizedBox(height: 8),
    Text('Interface: $interfaceLanguage', style: Theme.of(context).textTheme.bodyMedium),
    const SizedBox(height: 16),
    FilledButton(onPressed: onBack, child: const Text('Back')),
    const SizedBox(height: 800), // demo scroll
  ]);
}
