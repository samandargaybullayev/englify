import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final String icon;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const ModuleCard({
    super.key, // Key? o'rniga super.key ishlatish tavsiya etiladi
    required this.title,
    required this.icon,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // XATO TUZATILDI: .shade o'rniga rangni o'zgartirish usuli qo'llanildi
            colors: [
              color, // Asosiy rang
              Color.lerp(color, Colors.black, 0.3)! // Rangni 30% qoraytirish
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              // Soya rangi aniqroq bo'lishi uchun
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              // description texti qo'shilmagan ekan, uni ham qo'shib qo'ydim
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}