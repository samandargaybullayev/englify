import 'package:flutter/material.dart';

class ThemeCustomizer extends StatelessWidget {
  const ThemeCustomizer({super.key, required this.onClose});
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) => Column(children: [
    const SizedBox(height: 16),
    const Text('Theme customizer (coming soon)'),
    const SizedBox(height: 16),
    FilledButton(onPressed: onClose, child: const Text('Close')),
    const SizedBox(height: 600),
  ]);
}
