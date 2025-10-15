import 'package:shared_preferences/shared_preferences.dart';

class UserProgress {
  final String? selectedLanguage;
  final String? interfaceLanguage;
  final String? theme;

  UserProgress({this.selectedLanguage, this.interfaceLanguage, this.theme});
}

Future<UserProgress> getUserProgress() async {
  final p = await SharedPreferences.getInstance();
  return UserProgress(
    selectedLanguage: p.getString('selectedLanguage'),
    interfaceLanguage: p.getString('interfaceLanguage'),
    theme: p.getString('engly-theme'),
  );
}

Future<void> saveUserProgress({
  String? selectedLanguage,
  String? interfaceLanguage,
  String? theme,
}) async {
  final p = await SharedPreferences.getInstance();
  if (selectedLanguage != null) await p.setString('selectedLanguage', selectedLanguage);
  if (interfaceLanguage != null) await p.setString('interfaceLanguage', interfaceLanguage);
  if (theme != null) await p.setString('engly-theme', theme);
}

Future<void> updateStudySession() async {
  final p = await SharedPreferences.getInstance();
  await p.setInt('lastSession', DateTime.now().millisecondsSinceEpoch);
}
