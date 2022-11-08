import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';

class TapSelector extends StatefulWidget {
  final TabController tabController;

  const TapSelector({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<TapSelector> createState() => _TapSelectorState();
}

class _TapSelectorState extends State<TapSelector> {
  final double _indicatorSize = 10;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabPageSelector(
          controller: widget.tabController,
          indicatorSize: _indicatorSize,
          color: ProjectColors.terracotta.color(),
        )
      ],
    );
  }
}
