import 'package:flutter/material.dart';
// import '../theme/tokens.dart';
import '../main.dart';
import '../themes/tokens.dart';

class Dashboard_Page extends StatelessWidget {
  const Dashboard_Page({
    super.key,
    required this.onSelectModule,
    required this.selectedLanguage,
    required this.interfaceLanguage,
    required this.onNavigate,
  });

  final void Function(AppView) onSelectModule;
  final void Function(AppView) onNavigate;
  final String selectedLanguage;
  final String interfaceLanguage;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<BrandTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pill(context, Icons.local_fire_department_rounded, '15 Days Streak'),
            _pill(context, Icons.language, selectedLanguage[0].toUpperCase() + selectedLanguage.substring(1)),
          ],
        ),
        const SizedBox(height: 16),
        ShaderMask(
          shaderCallback: (r) => const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFF472B6)]).createShader(r),
          child: const Text('Welcome back to Engly!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
        ),
        const SizedBox(height: 6),
        Text('Continue your language learning journey', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        const SizedBox(height: 18),

        // stats grid
        LayoutBuilder(builder: (context, c) {
          final aw = c.maxWidth;
          final isWide = aw >= 680;
          final ratio = isWide ? 1.45 : (aw < 360 ? 0.85 : (aw < 380 ? 0.95 : 1.1));
          final cross = isWide ? 4 : 2;
          return GridView.count(
            crossAxisCount: cross,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: ratio,
            children: [
              _stat(context, Icons.local_fire_department_rounded, '15', 'Days Streak', t.destructiveGradient),
              _stat(context, Icons.timer_rounded, '24h 30m', 'Total Study Time', t.infoGradient),
              _stat(context, Icons.menu_book_rounded, '342', 'Words Learned', t.successGradient),
              _stat(context, Icons.tablet_rounded, '75%', 'Weekly Goal', t.accentGradient),
            ],
          );
        }),

        const SizedBox(height: 18),
        _challengeCard(context, t, onSelectModule),
        const SizedBox(height: 18),
        FilledButton.icon(
          onPressed: () => onSelectModule(AppView.vocabulary),
          icon: const Icon(Icons.play_circle_fill_rounded),
          label: const Text('Review'),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _pill(BuildContext c, IconData ic, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(c).colorScheme.surface.withOpacity(.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(c).colorScheme.outlineVariant.withOpacity(.3)),
      ),
      child: Row(children: [Icon(ic, size: 18), const SizedBox(width: 8), Text(text, style: const TextStyle(fontWeight: FontWeight.w600))]),
    );
  }

  Widget _stat(BuildContext c, IconData ic, String num, String lbl, Gradient g) {
    final cs = Theme.of(c).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surface.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withOpacity(.3)),
        boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 10, offset: Offset(0,4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ShaderMask(shaderCallback: (r) => g.createShader(r), child: Icon(ic, size: 26, color: Colors.white)),
        const SizedBox(height: 8),
        Expanded(child: Align(
          alignment: Alignment.centerLeft,
          child: FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerLeft, child:
          ShaderMask(shaderCallback: (r) => g.createShader(r), child:
          Text(num, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white)),
          ),
          ),
        )),
        const SizedBox(height: 4),
        Text(lbl, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: cs.onSurfaceVariant, fontWeight: FontWeight.w600))
      ]),
    );
  }

  Widget _challengeCard(BuildContext c, BrandTheme t, void Function(AppView) onStart) {
    return Container(
      decoration: BoxDecoration(
        gradient: t.warningGradient,
        borderRadius: BorderRadius.circular(t.radius + 6),
        boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 12, offset: Offset(0,6))],
      ),
      padding: const EdgeInsets.all(1.6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(c).cardTheme.color,
          borderRadius: BorderRadius.circular(t.radius + 4),
          border: Border.all(color: Theme.of(c).colorScheme.outlineVariant.withOpacity(.3)),
        ),
        child: Row(children: [
          const Icon(Icons.calendar_today_rounded, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Text('Daily Challenge', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: t.destructiveGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(children: [Icon(Icons.bolt, size: 14, color: Colors.white), SizedBox(width: 6), Text('+50 XP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))]),
              ),
            ]),
            const SizedBox(height: 8),
            Text("Complete today's vocabulary challenge to maintain your streak!",
                style: TextStyle(color: Colors.amber.shade100)),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: () => onStart(AppView.vocabulary),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Challenge'),
            ),
          ])),
        ]),
      ),
    );
  }
}