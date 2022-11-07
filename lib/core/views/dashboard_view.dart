import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/model/card_model.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';
import 'package:flutter_wallet_app/product/constants/project_duration.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/widgets/bottom_app_bar.dart';
import 'package:flutter_wallet_app/product/widgets/my_card.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with SingleTickerProviderStateMixin {
  final String _myCard = 'My Card';

  final double _elevation = 15;
  bool _isOpen = false;
  final double sizedBoxHeight = 200;
  late final List<CardModel> _cards;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _cards = CardModel.dummyCard();
    _tabController = TabController(length: CardModel.dummyCard().length, vsync: this);
  }

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
      child: Scaffold(
        body: Card(
          margin: EdgeInsets.zero,
          elevation: _elevation,
          child: Padding(
            padding: ProjectPadding.paddingLeftRightTop,
            child: Column(
              children: [_appBar(context), _pageViewBuilder(), _tabPageSelector()],
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
    );
  }

  Widget _tabPageSelector() {
    const double indicatorSize = 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabPageSelector(
          controller: _tabController,
          indicatorSize: indicatorSize,
          color: ProjectColors.blackRussian.color(),
          selectedColor: ProjectColors.blueRibbon.color(),
        )
      ],
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
