import 'package:flutter/material.dart';
import 'dart:ui'; // lerpDouble uchun zarur

/// BrandTheme - Gradientlar va maxsus ranglarni o'z ichiga olgan tema tokenlari
@immutable
class BrandTheme extends ThemeExtension<BrandTheme> {
  // Gradientlar
  final Gradient primaryGradient;
  final Gradient accentGradient;
  final Gradient destructiveGradient;
  final Gradient successGradient;
  final Gradient infoGradient;
  final Gradient warningGradient;

  // Qo'shimcha ranglar va qiymatlar
  final Color card;
  final Color border;
  final Color primaryForeground;
  final double radius;
  final List<BoxShadow> shadowLg;

  const BrandTheme({
    required this.primaryGradient,
    required this.accentGradient,
    required this.destructiveGradient,
    required this.successGradient,
    required this.infoGradient,
    required this.warningGradient,
    required this.card,
    required this.border,
    required this.primaryForeground,
    required this.radius,
    required this.shadowLg,
  });

  /// Yorug' tema uchun tokenlar
  static BrandTheme light = BrandTheme(
    primaryGradient: const LinearGradient(
        colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
    accentGradient: const LinearGradient(
        colors: [Color(0xFFA8EDEA), Color(0xFFFED6E3)]),
    destructiveGradient: const LinearGradient(
        colors: [Color(0xFFFF6B6B), Color(0xFFEE5A24)]),
    successGradient: const LinearGradient(
        colors: [Color(0xFF51CF66), Color(0xFF40C057)]),
    infoGradient: const LinearGradient(
        colors: [Color(0xFF74C0FC), Color(0xFF339AF0)]),
    warningGradient: const LinearGradient(
        colors: [Color(0xFFFFD43B), Color(0xFFFAB005)]),
    card: const Color(0xFFFFFFFF).withOpacity(.95),
    border: const Color(0xFFCBD5E1).withOpacity(.3),
    primaryForeground: Colors.white,
    radius: 16,
    shadowLg: const [
      BoxShadow(color: Color(0x14000000), blurRadius: 20, offset: Offset(0, 10))
    ],
  );

  /// Qorong'u tema uchun tokenlar
  static BrandTheme dark = BrandTheme(
    primaryGradient: const LinearGradient(
        colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)]),
    accentGradient: const LinearGradient(
        colors: [Color(0xFF06B6D4), Color(0xFF0891B2)]),
    destructiveGradient: const LinearGradient(
        colors: [Color(0xFFEF4444), Color(0xFFDC2626)]),
    successGradient: const LinearGradient(
        colors: [Color(0xFF10B981), Color(0xFF059669)]),
    infoGradient: const LinearGradient(
        colors: [Color(0xFF3B82F6), Color(0xFF2563EB)]),
    warningGradient: const LinearGradient(
        colors: [Color(0xFFF59E0B), Color(0xFFD97706)]),
    card: const Color(0xFF1E293B).withOpacity(.95),
    border: const Color(0xFF475569).withOpacity(.3),
    primaryForeground: Colors.white,
    radius: 16,
    shadowLg: const [
      BoxShadow(color: Color(0x33000000), blurRadius: 20, offset: Offset(0, 10))
    ],
  );

  @override
  BrandTheme copyWith({
    Gradient? primaryGradient,
    Gradient? accentGradient,
    Gradient? destructiveGradient,
    Gradient? successGradient,
    Gradient? infoGradient,
    Gradient? warningGradient,
    Color? card,
    Color? border,
    Color? primaryForeground,
    double? radius,
    List<BoxShadow>? shadowLg,
  }) {
    return BrandTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      accentGradient: accentGradient ?? this.accentGradient,
      destructiveGradient: destructiveGradient ?? this.destructiveGradient,
      successGradient: successGradient ?? this.successGradient,
      infoGradient: infoGradient ?? this.infoGradient,
      warningGradient: warningGradient ?? this.warningGradient,
      card: card ?? this.card,
      border: border ?? this.border,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      radius: radius ?? this.radius,
      shadowLg: shadowLg ?? this.shadowLg,
    );
  }

  @override
  BrandTheme lerp(ThemeExtension<BrandTheme>? other, double t) {
    if (other is! BrandTheme) {
      return this;
    }
    return BrandTheme(
      primaryGradient: Gradient.lerp(
          primaryGradient, other.primaryGradient, t)!,
      accentGradient: Gradient.lerp(accentGradient, other.accentGradient, t)!,
      destructiveGradient: Gradient.lerp(
          destructiveGradient, other.destructiveGradient, t)!,
      successGradient: Gradient.lerp(
          successGradient, other.successGradient, t)!,
      infoGradient: Gradient.lerp(infoGradient, other.infoGradient, t)!,
      warningGradient: Gradient.lerp(
          warningGradient, other.warningGradient, t)!,
      card: Color.lerp(card, other.card, t)!,
      border: Color.lerp(border, other.border, t)!,
      primaryForeground: Color.lerp(
          primaryForeground, other.primaryForeground, t)!,
      radius: lerpDouble(radius, other.radius, t)!,
      shadowLg: BoxShadow.lerpList(shadowLg, other.shadowLg, t)!,
    );
  }
}

/// BuildContext uchun qulaylik metodlari
extension BrandThemeExtension on BuildContext {
  BrandTheme get brandTheme => Theme.of(this).extension<BrandTheme>()!;
}