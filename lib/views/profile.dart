import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.onBack});
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) => Column(children: [
    const SizedBox(height: 16),
    const Text('Profile coming soon...'),
    const SizedBox(height: 16),
    if (onBack != null) FilledButton(onPressed: onBack, child: const Text('Back')),
  ]);
}
