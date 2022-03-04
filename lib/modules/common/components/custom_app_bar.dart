import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.text = "WhatsappClone",
    this.height = 65.0,
  }) : super(key: key);

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      toolbarHeight: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
