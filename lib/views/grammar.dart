import 'package:flutter/material.dart';

class Grammar_Page extends StatelessWidget {
  const Grammar_Page({super.key, required this.onBack, required this.selectedLanguage, required this.interfaceLanguage});
  final VoidCallback onBack;
  final String selectedLanguage;
  final String interfaceLanguage;

  @override
  Widget build(BuildContext context) => Column(children: [
    const SizedBox(height: 16),
    Text('Grammar ($selectedLanguage)', style: Theme.of(context).textTheme.headlineSmall),
    const SizedBox(height: 8),
    Text('Interface: $interfaceLanguage'),
    const SizedBox(height: 16),
    FilledButton(onPressed: onBack, child: const Text('Back')),
    const SizedBox(height: 800),
  ]);
}
