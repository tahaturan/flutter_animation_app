import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/product/constants/project_duration.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  final String _myCard = 'My Card';

  final double _elevation = 15;
  bool _isOpen = false;

  void _chanceOpen() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      top: _isOpen ? screenHeight * 0.1 : 0,
      bottom: _isOpen ? screenHeight * 0.1 : 0,
      left: _isOpen ? screenWidth * 0.5 : 0,
      right: _isOpen ? screenWidth * -0.3 : 0,
      duration: ProjectDuration().durationFast,
      curve: Curves.easeInOutCubicEmphasized,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: _elevation,
        child: Padding(
          padding: ProjectPadding.paddingLeftRightTop,
          child: Column(
            children: [
              _appBar(context),
            ],
          ),
        ),
      ),
    );
  }

  //* AppBar
  Widget _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _chanceOpen,
          icon: const Icon(Icons.menu),
        ),
        Text(_myCard, style: Theme.of(context).textTheme.titleLarge),
        const Icon(Icons.add_outlined),
      ],
    );
  }
}
