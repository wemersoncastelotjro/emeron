import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emeron/features/home/domain/entities/menu.entity.dart';

class MenuItemListWidget extends StatelessWidget {
  final MenuEntity menu;

  const MenuItemListWidget({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.25),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            menu.icon,
            size: 44,
            color: Colors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            menu.label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
