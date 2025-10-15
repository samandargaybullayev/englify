import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/tokens.dart';
// import '../theme/tokens.dart';

class AnimatedBottomNavBar extends StatelessWidget {
  const AnimatedBottomNavBar({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = <_NavItem>[
    _NavItem('Home', Icons.home_rounded),
    _NavItem('Words', Icons.menu_book_rounded),
    _NavItem('Grammar', Icons.edit_rounded),
    _NavItem('Read', Icons.chrome_reader_mode_rounded),
    _NavItem('Speak', Icons.mic_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<BrandTheme>();
    final gradient = t?.primaryGradient ?? const LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF764BA2)]);
    final fg = t?.primaryForeground ?? Colors.white;
    final borderColor = t?.border ?? Colors.white.withOpacity(0.18);

    final mq = MediaQuery.of(context);
    final tiny = mq.size.width < 360;
    final baseH = tiny ? 64.0 : 72.0;
    final bottomInset = mq.padding.bottom;
    final barH = baseH + (bottomInset > 0 ? 6 : 0);
    final count = _items.length;
    final safeIndex = currentIndex.clamp(0, count - 1);

    return SafeArea(
      top: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            height: barH,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              border: Border(top: BorderSide(color: borderColor)),
            ),
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8 + (bottomInset > 0 ? 4 : 0)),
            child: LayoutBuilder(builder: (context, c) {
              final itemW = (c.maxWidth - 20) / count;
              final pillW = itemW - (tiny ? 16 : 12);
              final pillLeft = safeIndex * itemW + (itemW - pillW) / 15;
              final showLabels = c.maxWidth > 380;

              return Stack(children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  left: pillLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    width: itemW,
                    height: (barH - 16).clamp(55.0, 56.0),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 12, offset: Offset(0, 6))],
                    ),
                  ),
                ),
                Row(
                  children: List.generate(count, (i) {
                    final it = _items[i];
                    final selected = i == safeIndex;
                    final color = selected ? fg : Theme.of(context).colorScheme.onSurfaceVariant;

                    return SizedBox(
                      width: itemW,
                      height: double.infinity,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(22),
                          splashFactory: InkSparkle.splashFactory,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            onTap(i);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(it.icon, color: color, size: tiny ? 20 : 22),
                              if (selected && showLabels) ...[
                                const SizedBox(height: 3),
                                AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 180),
                                  style: TextStyle(color: color, fontWeight: FontWeight.w700),
                                  child: Text(it.label),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ]);
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem { const _NavItem(this.label, this.icon); final String label; final IconData icon; }
