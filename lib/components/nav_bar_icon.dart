import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final Widget icon;
  final Widget activeIcon;
  final bool active;
  final VoidCallback? onTap;
  const NavBarIcon(
      {super.key, required this.icon, required this.activeIcon, required this.active, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: active ? activeIcon : icon
    );
  }
}
