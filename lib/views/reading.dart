import 'package:flutter/material.dart';

class ReadingModule extends StatelessWidget {
  const ReadingModule({super.key, required this.onBack, required this.selectedLanguage, required this.interfaceLanguage});
  final VoidCallback onBack;
  final String selectedLanguage;
  final String interfaceLanguage;

  @override
  Widget build(BuildContext context) => Column(children: [
    const SizedBox(height: 16),
    Text('Reading ($selectedLanguage)', style: Theme.of(context).textTheme.headlineSmall),
    const SizedBox(height: 16),
    FilledButton(onPressed: onBack, child: const Text('Back')),
    const SizedBox(height: 800),
  ]);
}
