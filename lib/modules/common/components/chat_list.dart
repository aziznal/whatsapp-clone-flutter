import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 56.0),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Text("test $index"),
      separatorBuilder: (context, index) => const SizedBox(height: 20.0),
      itemCount: 5,
    );
  }
}
