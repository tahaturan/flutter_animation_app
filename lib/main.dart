import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/views/home_page.dart';
import 'package:flutter_wallet_app/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const HomePage(),
    );
  }
}
