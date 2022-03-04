import 'package:flutter/material.dart';

void showComingSoonSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text("Coming Soon!"),
      action: SnackBarAction(
        label: 'hide',
        onPressed: () {},
      ),
    ),
  );
}
