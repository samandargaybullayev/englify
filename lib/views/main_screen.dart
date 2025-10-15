import 'package:flutter/material.dart';
import '../main.dart'; // Import AppView from main.dart to avoid duplicate definition
import 'dashboard.dart';
import 'vocabulary.dart';
import 'grammar.dart';
import 'reading.dart';
import 'speaking.dart';
import 'language_selector.dart';
import 'settings.dart';

// Remove the duplicate AppView enum definition here; use the one from main.dart

// 1-qadam: Pastki menyu elementi uchun alohida model klassini yaratamiz.
class BottomNavItem {
  final AppView id;
  final IconData icon;
  final String label;

  const BottomNavItem({
    required this.id,
    required this.icon,
    required this.label,
  });
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppView currentView = AppView.dashboard;
  String selectedLanguage = 'spanish';
  String interfaceLanguage = 'english';

  // 2-qadam: Menyudagi elementlar ro'yxatini yangi model bilan yangilaymiz.
  final List<BottomNavItem> _navItems = const [
    BottomNavItem(id: AppView.dashboard, icon: Icons.home, label: 'Home'),
    BottomNavItem(id: AppView.vocabulary, icon: Icons.book, label: 'Vocab'),
    BottomNavItem(id: AppView.grammar, icon: Icons.edit_note, label: 'Grammar'),
    BottomNavItem(id: AppView.reading, icon: Icons.menu_book, label: 'Reading'),
    BottomNavItem(id: AppView.speaking, icon: Icons.mic, label: 'Speaking'),
  ];

  void _handleNavigate(AppView view) {
    setState(() {
      currentView = view;
    });
  }

  void _handleBackToDashboard() {
    setState(() {
      currentView = AppView.dashboard;
    });
  }

  void _handleLanguageChange(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  void _handleInterfaceLanguageChange(String language) {
    setState(() {
      interfaceLanguage = language;
    });
  }

  Widget _renderCurrentView() {
    switch (currentView) {
      case AppView.dashboard:
        return Dashboard_Page(
          onSelectModule: _handleNavigate,
          selectedLanguage: selectedLanguage,
          interfaceLanguage: interfaceLanguage,
          onNavigate: (AppView _) => _handleBackToDashboard(),
        );

      case AppView.vocabulary:
        return VocabularyPage(
          selectedLanguage: selectedLanguage,
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
        );
      case AppView.grammar:
        return Grammar_Page(
          selectedLanguage: selectedLanguage,
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
        );
      case AppView.reading:
        return ReadingModule(
          selectedLanguage: selectedLanguage,
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
        );
      case AppView.speaking:
        return Speaking_Page(
          selectedLanguage: selectedLanguage,
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
        );
      case AppView.languages:
        return LanguageSelectorView(
          selectedLanguage: selectedLanguage,
          onLanguageChange: _handleLanguageChange,
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
          onInterfaceLanguageChange: _handleInterfaceLanguageChange,
        );
      case AppView.settings:
        return SettingsView(
          onBack: _handleBackToDashboard,
          interfaceLanguage: interfaceLanguage,
          onInterfaceLanguageChange: _handleInterfaceLanguageChange,
          themeMode: ThemeMode.system,
          onThemeChange: (ThemeMode value) {},
        );
      default:
        return Dashboard_Page(
          onSelectModule: _handleNavigate,
          selectedLanguage: selectedLanguage,
          interfaceLanguage: interfaceLanguage,
          onNavigate: (AppView _) => _handleBackToDashboard(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1729),
      body: SafeArea(child: _renderCurrentView()),
      bottomNavigationBar:
      currentView != AppView.settings && currentView != AppView.languages
          ? _buildBottomNavigation()
          : null,
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A2332),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.map((item) {
              final isActive = currentView == item.id;
              return InkWell(
                // 3-qadam: InkWell uchun `borderRadius` qo'shib, bosish effektini chiroyli qilamiz.
                borderRadius: BorderRadius.circular(12),
                onTap: () => _handleNavigate(item.id),
                child: Padding(
                  // 4-qadam: Elementlar atrofida bo'sh joy qo'shamiz
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 0,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        item.icon,
                        color: isActive
                            ? const Color(0xFFB65EF7)
                            : const Color(0xFF64748B),
                        size: 26,
                      ),
                      // SizedBox(height: 4),
                      Text(
                        // item.label,
                        "HI",
                        style: TextStyle(
                          fontSize: 12,
                          color: isActive
                              ? const Color(0xFFB65EF7)
                              : const Color(0xFF64748B),
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}