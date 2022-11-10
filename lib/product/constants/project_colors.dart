import 'package:flutter/material.dart';

class ProjectGradiendColor {
  static final List<Color> gradiendOne = [const Color(0xFF020024), const Color(0xFF093179), const Color(0xFF0097ff)];
  static final List<Color> kingYna = [const Color(0xFF1a2a6c), const Color(0xFFb21f1f), const Color(0xFFfdbb2d)];
  static final List<Color> chittyChitty = [const Color(0xFF4776E6), const Color(0xFF8E54E9)];
}

enum ProjectColors { sceptreBlue, white, dodgerBlue, blueRibbon, terracotta, mySin, blackRussian, darkPansy }

extension ProjectColorsExtension on ProjectColors {
  Color color() {
    switch (this) {
      case ProjectColors.sceptreBlue:
        return const Color(0xFF343442);
      case ProjectColors.white:
        return Colors.white;
      case ProjectColors.dodgerBlue:
        return const Color(0xFF396afc);
      case ProjectColors.blueRibbon:
        return const Color(0xFF2948ff);
      case ProjectColors.terracotta:
        return const Color(0xFFb21f1f);
      case ProjectColors.mySin:
        return const Color(0xFFfdbb2d);
      case ProjectColors.blackRussian:
        return const Color(0xFF020024);
      case ProjectColors.darkPansy:
        return const Color(0xFF663a82);
    }
  }
}
