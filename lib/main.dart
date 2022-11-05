import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/views/home_page.dart';
import 'package:flutter_wallet_app/product/theme/global_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
