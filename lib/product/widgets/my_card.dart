import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/model/card_model.dart';
import 'package:flutter_wallet_app/product/constants/project_border_radius.dart';
import 'package:flutter_wallet_app/product/constants/project_colors.dart';
import 'package:flutter_wallet_app/product/constants/project_padding.dart';
import 'package:flutter_wallet_app/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  final CardModel? cardModel;
  const MyCard({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final String _balanceTitle = 'Cuurent Balance';
  final String _name = 'Name';
  final String _expiration = 'Expiration date';
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: ProjectPadding.paddingTop,
      child: SizedBox(
        width: screenWidth * 0.8,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.watch<ThemeNotifier>().isDarkTheme
                      ? ProjectGradiendColor.kingYna
                      : ProjectGradiendColor.chittyChitty,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: ProjectBoderRadius().radiusCircularAll(value: 20),
                boxShadow: [
                  BoxShadow(color: ProjectColors.blueRibbon.color(), blurRadius: 3, spreadRadius: 0.8),
                  BoxShadow(color: ProjectColors.blackRussian.color(), blurRadius: 4, spreadRadius: 0.7),
                  BoxShadow(color: ProjectColors.mySin.color(), blurRadius: 1, spreadRadius: 0.7),
                ]),
            child: _cardInform(context),
          ),
        ),
      ),
    );
  }

  Widget _cardInform(BuildContext context) {
    return Padding(
      padding: ProjectPadding.paddingAll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_balanceTitle,
                      style: context.watch<ThemeNotifier>().isDarkTheme
                          ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)
                          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Text('\$${widget.cardModel?.balance}', style: Theme.of(context).textTheme.headline6),
                ],
              ),
              Text(widget.cardModel?.bank ?? '',
                  style: context.watch<ThemeNotifier>().isDarkTheme
                      ? Theme.of(context).textTheme.bodyLarge
                      : Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
            ],
          ),
          Text(widget.cardModel?.cardNumber ?? '',
              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name,
                      style: context.watch<ThemeNotifier>().isDarkTheme
                          ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)
                          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Text(widget.cardModel?.name ?? '')
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_expiration,
                      style: context.watch<ThemeNotifier>().isDarkTheme
                          ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)
                          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Text('${widget.cardModel?.month}/${widget.cardModel?.year}')
                ],
              ),
              SizedBox(
                width: 35,
                child: Stack(
                  children: const [
                    Icon(Icons.circle_outlined),
                    Positioned(left: 10, child: Icon(Icons.circle_outlined)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
