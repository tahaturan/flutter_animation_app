import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ProjectColors.sceptreBlue.color(),
    appBarTheme: AppBarTheme(color: ProjectColors.sceptreBlue.color()),
    textTheme: TextTheme(headline5: TextStyle(color: ProjectColors.white.color())),
    iconTheme: IconThemeData(color: ProjectColors.white.color()),
    cardColor: ProjectColors.sceptreBlue.color(),
  );
  static ThemeData lightTheme = ThemeData.light();
}

enum ProjectColors { sceptreBlue, white }

extension ProjectColorsExtension on ProjectColors {
  Color color() {
    switch (this) {
      case ProjectColors.sceptreBlue:
        return const Color(0xFF343442);
      case ProjectColors.white:
        return Colors.white;
    }
  }
}
