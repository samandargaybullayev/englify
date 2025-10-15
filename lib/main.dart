import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/themes/app_theme.dart';
import 'package:hello_world/utils/storage.dart';
import 'package:hello_world/views/profile.dart';
import 'package:hello_world/views/theme_customizer.dart';
import 'package:hello_world/views/view_transition.dart';
import 'package:hello_world/widgets/frosted_bottom_bar.dart';
import 'package:hello_world/widgets/gradient_background.dart';
import 'package:hello_world/widgets/offline_indicator.dart';
import 'package:hello_world/widgets/scroll_scaffold.dart';
import 'views/dashboard.dart';
import 'views/vocabulary.dart';
import 'views/grammar.dart';
import 'views/reading.dart';
import 'views/speaking.dart';
import 'views/language_selector.dart';
import 'views/settings.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Android edge-to-edge
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(const EnglyApp());
}

enum AppView {
  dashboard, vocabulary, grammar, reading, speaking, languages, profile, settings, theme,
}

class EnglyApp extends StatefulWidget {
  const EnglyApp({super.key});
  @override
  State<EnglyApp> createState() => _EnglyAppState();
}

class _EnglyAppState extends State<EnglyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  AppView _view = AppView.dashboard;
  String _selectedLanguage = 'spanish';
  String _interfaceLanguage = 'english';
  bool _loading = true;

  final _navOrder = const [
    AppView.dashboard, AppView.vocabulary, AppView.grammar, AppView.reading, AppView.speaking,
  ];

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // kichik “loading” kechikish
    await Future.delayed(const Duration(milliseconds: 800));
    final p = await getUserProgress();
    setState(() {
      _selectedLanguage = p.selectedLanguage ?? _selectedLanguage;
      _interfaceLanguage = p.interfaceLanguage ?? _interfaceLanguage;
      _themeMode = switch (p.theme ?? 'system') {
        'dark' => ThemeMode.dark,
        'light' => ThemeMode.light,
        _ => ThemeMode.system,
      };
      _loading = false;
    });
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    await saveUserProgress(theme: switch (mode) {
      ThemeMode.dark => 'dark',
      ThemeMode.light => 'light',
      _ => 'system',
    });
  }

  // navigation helpers
  void _go(AppView v) => setState(() => _view = v);
  void _home() => setState(() => _view = AppView.dashboard);

  String _title(AppView v) => switch (v) {
    AppView.dashboard => 'Engly',
    AppView.vocabulary => 'Vocabulary',
    AppView.grammar => 'Grammar',
    AppView.reading => 'Reading',
    AppView.speaking => 'Speaking',
    AppView.languages => 'Languages',
    AppView.profile => 'Profile',
    AppView.settings => 'Settings',
    AppView.theme => 'Theme Customizer',
  };

  String _animDirection(AppView v) => switch (v) {
    AppView.dashboard => 'scale',
    AppView.vocabulary => 'left',
    AppView.grammar => 'up',
    AppView.reading => 'right',
    AppView.speaking => 'rotate',
    AppView.languages => 'down',
    AppView.settings => 'left',
    _ => 'scale',
  };

  Widget _render() => switch (_view) {
    AppView.dashboard => Dashboard_Page(
      selectedLanguage: _selectedLanguage,
      interfaceLanguage: _interfaceLanguage,
      onSelectModule: (v) => _go(v),
      onNavigate: (v) => _go(v),
    ),
    AppView.vocabulary => VocabularyPage(onBack: _home, selectedLanguage: _selectedLanguage, interfaceLanguage: _interfaceLanguage),
    AppView.grammar => Grammar_Page(onBack: _home, selectedLanguage: _selectedLanguage, interfaceLanguage: _interfaceLanguage),
    AppView.reading => ReadingModule(onBack: _home, selectedLanguage: _selectedLanguage, interfaceLanguage: _interfaceLanguage),
    AppView.speaking => Speaking_Page(onBack: _home, selectedLanguage: _selectedLanguage, interfaceLanguage: _interfaceLanguage),
    AppView.languages => LanguageSelectorView(
      selectedLanguage: _selectedLanguage,
      interfaceLanguage: _interfaceLanguage,
      onLanguageChange: (l) async { setState(() => _selectedLanguage = l); await saveUserProgress(selectedLanguage: l); },
      onInterfaceLanguageChange: (l) async { setState(() => _interfaceLanguage = l); await saveUserProgress(interfaceLanguage: l); },
      onBack: _home,
    ),
    AppView.profile => const ProfilePage(onBack: null), // stub
    AppView.settings => SettingsView(
      interfaceLanguage: _interfaceLanguage,
      onInterfaceLanguageChange: (l) async { setState(() => _interfaceLanguage = l); await saveUserProgress(interfaceLanguage: l); },
      themeMode: _themeMode,
      onThemeChange: (mode) { setState(() => _themeMode = mode); _saveTheme(mode); },
      onBack: _home,
    ),
    AppView.theme => ThemeCustomizer(onClose: _home),
  };

  @override
  Widget build(BuildContext context) {
    if (_loading) return const LoadingScreen();

    return MaterialApp(
      title: 'Engly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final clamped = mq.textScaler.clamp(minScaleFactor: 0.85, maxScaleFactor: 1.25);
        return MediaQuery(
          data: mq.copyWith(textScaler: clamped),
          child: ScrollConfiguration(
            behavior: const _NoGlow(),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
      home: Builder(
        builder: (context) {
          final size = MediaQuery.of(context).size;
          final isLarge = size.width >= 1024;
          final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          final showBottomNav = !isLarge && _navOrder.contains(_view) && !keyboardOpen;

          return GradientBackground(
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                title: Text(_title(_view), style: const TextStyle(fontWeight: FontWeight.bold)),
                leading: _view != AppView.dashboard ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: _home) : null,
                actions: [
                  if (_view == AppView.dashboard)
                    IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () => _go(AppView.settings)),
                  if (_view != AppView.languages && _view != AppView.theme && _view != AppView.settings)
                    TextButton.icon(
                      onPressed: () => _go(AppView.languages),
                      icon: const Icon(Icons.language),
                      label: Text(_selectedLanguage[0].toUpperCase() + _selectedLanguage.substring(1)),
                    ),
                ],
              ),
              body: OfflineOverlay(
                child: ScrollScaffold(
                  // progress bar + scroll-to-top + pull-to-refresh
                  onRefresh: () async {
                    final p = await getUserProgress();
                    if (p.selectedLanguage != null) setState(() => _selectedLanguage = p.selectedLanguage!);
                  },
                  child: ViewTransition(
                    key: ValueKey(_view),
                    direction: _animDirection(_view),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _render(),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: showBottomNav
                  ? AnimatedBottomNavBar(
                currentIndex: _navOrder.indexOf(_view),
                onTap: (i) => _go(_navOrder[i]),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class _NoGlow extends ScrollBehavior {
  const _NoGlow();
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}

/// very small loading
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) => const Material(
    child: Center(child: CircularProgressIndicator()),
  );
}
