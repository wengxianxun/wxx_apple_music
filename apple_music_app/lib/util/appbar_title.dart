import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  const AppbarTitle({
    this.title = "",
    this.fontSize = 18,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.alef(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color:
            color == Colors.black
                ? GetTheme(HuuuaColorEnum.color_000000)
                : color, //Get.isDarkMode ? Colors.white : Colors.black
      ),
    );
  }
}
