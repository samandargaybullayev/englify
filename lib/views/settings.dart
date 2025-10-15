import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.onBack,
    required this.interfaceLanguage,
    required this.onInterfaceLanguageChange,
    required this.themeMode,
    required this.onThemeChange,
  });

  final VoidCallback onBack;
  final String interfaceLanguage;
  final ValueChanged<String> onInterfaceLanguageChange;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 12),
      Text('Settings', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 16),
      DropdownButtonFormField<ThemeMode>(
        value: themeMode,
        decoration: const InputDecoration(labelText: 'Theme'),
        items: const [
          DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
          DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
          DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
        ],
        onChanged: (m) => onThemeChange(m ?? ThemeMode.system),
      ),
      const SizedBox(height: 16),
      DropdownButtonFormField<String>(
        value: interfaceLanguage,
        decoration: const InputDecoration(labelText: 'Interface language'),
        items: const ['english','spanish','uzbek','turkish','german']
            .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) => onInterfaceLanguageChange(v ?? interfaceLanguage),
      ),
      const SizedBox(height: 16),
      FilledButton(onPressed: onBack, child: const Text('Back')),
      const SizedBox(height: 800),
    ]);
  }
}
