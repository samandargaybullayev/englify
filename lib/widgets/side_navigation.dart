import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  final String currentView;
  final Function(String) onNavigate;

  const SideNavigation({
    super.key, // Key? key o'rniga zamonaviy super.key sintaksisini ishlatish tavsiya etiladi
    required this.currentView,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    // Mavzuga qarab ranglarni aniqlab olamiz
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final activeColor = Colors.indigo.shade400; // Tanlangan element rangi
    final inactiveColor = isDark ? Colors.grey.shade400 : Colors.grey
        .shade700; // Tanlanmagan element rangi
    final backgroundColor = isDark ? const Color(0xFF1E293B) : Colors
        .white; // Fon rangi

    final items = [
      {
        'id': 'dashboard',
        'label': 'Dashboard',
        'icon': Icons.dashboard_rounded
      },
      {'id': 'vocabulary', 'label': 'Vocabulary', 'icon': Icons.book_rounded},
      {'id': 'grammar', 'label': 'Grammar', 'icon': Icons.edit_rounded},
      {'id': 'reading', 'label': 'Reading', 'icon': Icons.menu_book_rounded},
      {'id': 'speaking', 'label': 'Speaking', 'icon': Icons.mic_rounded},
      // Oxirgi elementdan keyin bo'sh joy qoldirish uchun Spacer yoki Divider qo'shamiz
      // {'id': 'settings', 'label': 'Settings', 'icon': Icons.settings_rounded},
    ];

    final settingsItem = {
      'id': 'settings',
      'label': 'Settings',
      'icon': Icons.settings_rounded
    };


    return Container(
      width: 250,
      color: backgroundColor,
      child: Column(
        children: [
          // Ilova logotipi va nomi
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                const Text(
                  '✨', // Emoji
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  'Engly',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(indent: 16, endIndent: 16),
          // Navigatsiya menyusi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isActive = currentView == item['id'];
                return ListTile(
                  leading: Icon(
                    item['icon'] as IconData,
                    color: isActive ? activeColor : inactiveColor,
                  ),
                  title: Text(
                    item['label'] as String,
                    style: TextStyle(
                      fontWeight: isActive ? FontWeight.bold : FontWeight
                          .normal,
                      color: isActive ? activeColor : theme.textTheme.bodyLarge
                          ?.color,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  selected: isActive,
                  selectedTileColor: activeColor.withOpacity(0.1),
                  onTap: () => onNavigate(item['id'] as String),
                );
              },
            ),
          ),
          // Sozlamalar menyusi (pastga yopishtirilgan)
          const Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                settingsItem['icon'] as IconData,
                color: currentView == settingsItem['id']
                    ? activeColor
                    : inactiveColor,
              ),
              title: Text(
                settingsItem['label'] as String,
                style: TextStyle(
                  fontWeight: currentView == settingsItem['id'] ? FontWeight
                      .bold : FontWeight.normal,
                  color: currentView == settingsItem['id'] ? activeColor : theme
                      .textTheme.bodyLarge?.color,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              selected: currentView == settingsItem['id'],
              selectedTileColor: activeColor.withOpacity(0.1),
              onTap: () => onNavigate(settingsItem['id'] as String),
            ),
          ),
          const SizedBox(height: 10), // Pastdan qo'shimcha joy
        ],
      ),
    );
  }
}