import 'package:flutter/material.dart';

import 'package:flutter_wallet_app/core/model/card_model.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';
import 'package:flutter_wallet_app/product/constants/project_duration.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/widgets/bottom_app_bar.dart';
import 'package:flutter_wallet_app/product/widgets/my_card.dart';
import 'package:flutter_wallet_app/product/widgets/my_listtile.dart';
import 'package:flutter_wallet_app/product/widgets/tab_selector.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with TickerProviderStateMixin {
  final String _myCard = 'My Card';

  final double _elevation = 15;
  bool _isOpen = false;
  final double sizedBoxHeight = 200;
  late final List<CardModel> _cards;
  late final TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _cards = CardModel.dummyCard();
    _tabController = TabController(length: CardModel.dummyCard().length, vsync: this);
    _animationController = AnimationController(vsync: this, duration: ProjectDuration().durationFast);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _chanceOpen() {
    setState(() {
      _isOpen ? _animationController.reverse() : _animationController.forward();
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: _isOpen ? screenWidth * 0.5 : 0,
      right: _isOpen ? screenWidth * -0.3 : 0,
      duration: ProjectDuration().durationFast,
      curve: Curves.easeInOutQuint,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Scaffold(
          body: Card(
            margin: EdgeInsets.zero,
            elevation: _elevation,
            child: Padding(
              padding: ProjectPadding.paddingLeftRightTop,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(context),
                    _pageViewBuilder(),
                    TapSelector(tabController: _tabController),
                    const SizedBox(height: 15),
                    const _Body()
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            splashColor: ProjectColors.blueRibbon.color(),
            onPressed: () {},
            child: Icon(Icons.qr_code, color: ProjectColors.white.color()),
          ),
          bottomNavigationBar: const MyBottomAppBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        ),
      ),
    );
  }

  Widget _pageViewBuilder() {
    return SizedBox(
      height: sizedBoxHeight,
      child: PageView.builder(
        onPageChanged: (value) {
          _tabController.animateTo(value, duration: ProjectDuration().durationFast, curve: Curves.easeInExpo);
        },
        controller: PageController(viewportFraction: 0.95),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return MyCard(cardModel: _cards[index]);
        },
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

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Icon(Icons.compare_arrows_outlined)
          ],
        ),
        const SizedBox(height: 15),
        Text('Today', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
        const MyListtile(
            product: "Macbook Pro 15'", company: 'Apple', amound: 2499, icon: Icons.apple_outlined, isBuy: true),
        const MyListtile(
            product: "Incomming Transfer", company: 'UpWork', amound: 499, icon: Icons.swipe_up_outlined, isBuy: false),
        Text('Yesterday', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
        const MyListtile(
            product: "Airpods Pro", company: 'Apple', amound: 199, icon: Icons.apple_outlined, isBuy: true),
        const MyListtile(
            product: "Coffe", company: 'Starbucks', amound: 19.50, icon: Icons.coffee_outlined, isBuy: true),
        const MyListtile(
            product: "Money Transfer",
            company: 'Yapi Kredi',
            amound: 500,
            icon: Icons.attach_money_outlined,
            isBuy: false),
      ],
    );
  }
}
