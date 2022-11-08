// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_wallet_app/product/constants/project_colors.dart';

class MyListtile extends StatelessWidget {
  const MyListtile({
    Key? key,
    required this.product,
    required this.company,
    required this.amound,
    required this.icon,
    required this.isBuy,
  }) : super(key: key);
  final String product;
  final String company;
  final double amound;
  final IconData icon;
  final bool isBuy;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product),
      subtitle: Text(company, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
      trailing: isBuy
          ? Text('-$amound \$', style: TextStyle(color: ProjectColors.blackRussian.color()))
          : Text('+$amound \$', style: TextStyle(color: ProjectColors.mySin.color())),
      leading: CircleAvatar(backgroundColor: ProjectColors.blackRussian.color(), child: Icon(icon)),
    );
  }
}
