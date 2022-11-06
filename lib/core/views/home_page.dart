import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/views/dashboard_view.dart';
import 'package:flutter_wallet_app/core/views/menu_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            MenuView(),
            DashBoardView(),
          ],
        ),
      ),
    );
  }
}
