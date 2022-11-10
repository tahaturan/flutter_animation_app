import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/product/theme/global_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkTheme = true;

  void chanceTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isDarkTheme ? GlobalTheme.darkTheme : GlobalTheme.lightTheme;
}
