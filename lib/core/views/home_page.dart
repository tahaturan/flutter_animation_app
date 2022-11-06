import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/views/constants/string_constants.dart';
import 'package:flutter_wallet_app/product/constants/project_duration.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/widgets/menu_icon.dart';

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
            _Menu(),
            _DashBoard(),
          ],
        ),
      ),
    );
  }
}

class _DashBoard extends StatefulWidget {
  const _DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<_DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<_DashBoard> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _chanceOpen,
                    icon: const Icon(Icons.menu),
                  ),
                  Text(_myCard, style: Theme.of(context).textTheme.titleLarge),
                  const Icon(Icons.add_outlined),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
  }) : super(key: key);
  final String _logOut = 'Log out';

  final String _description = 'Aydin, TR';

  final String _name = 'Taha TURAN';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.paddingLeft,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 150, height: 150, child: Image.asset('assets/png/ic_avatar.png')),
            Padding(
              padding: ProjectPadding.paddingLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.bodyMedium),
                  Text(_description, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const MenuIcon(name: StringConstants.menuDasboard, icon: Icons.dashboard_outlined),
            const MenuIcon(name: StringConstants.menuMessage, icon: Icons.message_rounded),
            const MenuIcon(name: StringConstants.menuUtilityBills, icon: Icons.data_thresholding_outlined),
            const MenuIcon(name: StringConstants.menuFoundTransfer, icon: Icons.transfer_within_a_station_outlined),
            const MenuIcon(name: StringConstants.menuBranches, icon: Icons.home_work_outlined),
            Expanded(child: MenuIcon(name: _logOut, icon: Icons.exit_to_app_outlined))
          ],
        ),
      ),
    );
  }
}
