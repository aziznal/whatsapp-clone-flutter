import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.text = "WhatsappClone",
    this.height = 65.0,
    this.actions = const [],
  }) : super(key: key);

  final String text;
  final double height;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      toolbarHeight: height,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
