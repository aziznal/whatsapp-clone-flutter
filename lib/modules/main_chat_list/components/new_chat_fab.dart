import 'package:flutter/material.dart';

class NewChatFAB extends StatelessWidget {
  const NewChatFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Coming Soon!"),
          action: SnackBarAction(
            label: "hide",
            onPressed: () {},
          ),
        ));
      },
      child: const Icon(Icons.message),
    );
  }
}
