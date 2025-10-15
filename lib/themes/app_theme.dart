import 'package:flutter/material.dart';
import 'tokens.dart'; // BrandTheme shu yerda deb faraz qilindi

/// "Cyber Neon" uslubidagi to'liq sozlangan AppTheme
class AppTheme {
  // Bu klassdan to'g'ridan-to'g'ri nusxa (instance) olinmasligi uchun.
  AppTheme._();

  // Asosiy ranglar palitrasi
  static const Color _primaryLight = Color(
      0xFF6A11CB); // Yorug' tema asosiy rangi
  static const Color _primaryDark = Color(
      0xFFC048F0); // Qorong'u tema asosiy rangi
  static const Color _accentLight = Color(
      0xFF2575FC); // Yorug' tema ikkinchi darajali rangi
  static const Color _accentDark = Color(
      0xFF00F2FE); // Qorong'u tema ikkinchi darajali rangi

  // Asosiy yorug' tema bazasi
  static final _lightBase = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryLight,
      primary: _primaryLight,
      secondary: _accentLight,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  // Asosiy qorong'u tema bazasi
  static final _darkBase = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryDark,
      primary: _primaryDark,
      secondary: _accentDark,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );

  /// YORUG' TEMA - Zamonaviy va Toza ko'rinish
  static ThemeData light() {
    final brandTheme = BrandTheme.light; // tokens.dart faylidan

    return _lightBase.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      // Och kulrang fon
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF1A1A2E),
        // To'q ko'k matn
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: Color(0x1A6A11CB),
        // Siyohrang soya
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A1A2E),
        ),
      ),
      // cardTheme QISMI OLIB TASHLANDI
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: _primaryLight,
        unselectedItemColor: Colors.grey,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEAEAF2), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEAEAF2), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryLight, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryLight,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: _primaryLight.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
          color: Color(0xFFEAEAF2), thickness: 1),
      iconTheme: const IconThemeData(color: Color(0xFF1A1A2E), size: 24),
      textTheme: _lightBase.textTheme.apply(
        fontFamily: 'Poppins',
        bodyColor: const Color(0xFF1A1A2E),
        displayColor: const Color(0xFF1A1A2E),
      ),
      extensions: <ThemeExtension<dynamic>>[
        brandTheme,
      ],
    );
  }

  /// QORONG'U TEMA - "Cyber Neon" uslubi
  static ThemeData dark() {
    final brandTheme = BrandTheme.dark; // tokens.dart faylidan

    return _darkBase.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0F0F1B),
      // Juda to'q ko'k fon
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1A2E),
        // To'q fon
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      // cardTheme QISMI OLIB TASHLANDI
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1A1A2E),
        selectedItemColor: _primaryDark,
        unselectedItemColor:  Colors.grey.shade600,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A1A2E),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 14),
        hintStyle: TextStyle(color: Colors.grey.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryDark, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryDark,
          foregroundColor: const Color(0xFF1A1A2E),
          // To'q matn
          elevation: 4,
          shadowColor: _primaryDark.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade800, thickness: 1),
      iconTheme: const IconThemeData(color: Colors.white, size: 24),
      textTheme: _darkBase.textTheme.apply(
        fontFamily: 'Poppins',
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      extensions: <ThemeExtension<dynamic>>[
        brandTheme,
      ],
    );
  }
}