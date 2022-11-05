import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ProjectColors.sceptreBlue.color(),
    appBarTheme: AppBarTheme(color: ProjectColors.sceptreBlue.color()),
    textTheme: const TextTheme(headline5: TextStyle(color: Colors.white)),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}

enum ProjectColors {
  sceptreBlue,
}

extension ProjectColorsExtension on ProjectColors {
  Color color() {
    switch (this) {
      case ProjectColors.sceptreBlue:
        return const Color(0xFF343442);
    }
  }
}
