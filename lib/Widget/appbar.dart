import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTap;
  final String? title;
  final IconData? icon;

  MyAppBar({required this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title ?? '', // Using null-aware operator to handle null values
        style: const TextStyle(color: Colors.black),
      ),
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

