import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/constants/string_constants.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/widgets/menu_icon.dart';

class MenuView extends StatelessWidget {
  const MenuView({
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