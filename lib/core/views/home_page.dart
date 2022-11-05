import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/views/constants/string_constants.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/theme/global_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String _myCard = 'My Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const _Menu(),
            Material(
              elevation: 8,
              color: ProjectColors.sceptreBlue.color(),
              child: Padding(
                padding: ProjectPadding.paddingLeftRightTop,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu),
                        Text(_myCard, style: Theme.of(context).textTheme.titleLarge),
                        const Icon(Icons.add_outlined),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
  }) : super(key: key);

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
            Text(StringConstants.menuDasboard, style: Theme.of(context).textTheme.headline5),
            Text(StringConstants.menuMessage, style: Theme.of(context).textTheme.headline5),
            Text(StringConstants.menuUtilityBills, style: Theme.of(context).textTheme.headline5),
            Text(StringConstants.menuFoundTransfer, style: Theme.of(context).textTheme.headline5),
            Text(StringConstants.menuBranches, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}
