import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';

class GlobalTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ProjectColors.sceptreBlue.color(),
      appBarTheme: AppBarTheme(color: ProjectColors.sceptreBlue.color()),
      textTheme: TextTheme(headline5: TextStyle(color: ProjectColors.white.color())),
      iconTheme: const IconThemeData(color: Colors.white),
      cardColor: ProjectColors.sceptreBlue.color(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ProjectColors.blackRussian.color(),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: ProjectColors.sceptreBlue.color()));
  static ThemeData lightTheme = ThemeData.light();
}
