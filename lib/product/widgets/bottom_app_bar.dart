import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({super.key});

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _currentIndex = 0;

  void _chanceIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _chanceIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ProjectColors.sceptreBlue.color(),
        elevation: 0,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.data_thresholding_outlined), label: 'Utilty'),
          BottomNavigationBarItem(icon: Icon(Icons.transfer_within_a_station_outlined), label: 'Transfer'),
        ],
      ),
    );
  }
}
