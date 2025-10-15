import 'package:flutter/material.dart';

class LanguageSelectorView extends StatelessWidget {
  const LanguageSelectorView({
    super.key,
    required this.selectedLanguage,
    required this.interfaceLanguage,
    required this.onLanguageChange,
    required this.onInterfaceLanguageChange,
    required this.onBack,
  });

  final String selectedLanguage;
  final String interfaceLanguage;
  final ValueChanged<String> onLanguageChange;
  final ValueChanged<String> onInterfaceLanguageChange;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final langs = const ['spanish', 'english', 'uzbek', 'turkish', 'german'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text('Select language', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: langs.map((l) => ChoiceChip(
            label: Text(l[0].toUpperCase() + l.substring(1)),
            selected: selectedLanguage == l,
            onSelected: (_) => onLanguageChange(l),
          )).toList(),
        ),
        const SizedBox(height: 16),
        Text('Interface language: $interfaceLanguage'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: langs.map((l) => ChoiceChip(
            label: Text(l[0].toUpperCase() + l.substring(1)),
            selected: interfaceLanguage == l,
            onSelected: (_) => onInterfaceLanguageChange(l),
          )).toList(),
        ),
        const SizedBox(height: 16),
        FilledButton(onPressed: onBack, child: const Text('Back')),
        const SizedBox(height: 500),
      ],
    );
  }
}
