import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String name;
  final IconData icon;
  const MenuIcon({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, color: Colors.grey)),
        Text(name, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
