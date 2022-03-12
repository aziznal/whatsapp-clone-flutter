import 'package:flutter/material.dart';

class MessageSendFieldWidget extends StatelessWidget {
  const MessageSendFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 90,
          child: Container(
            color: Color.fromARGB(255, 0, 63, 180),
            child: Center(child: Text('MessageSendFieldWidget')),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            color: Color.fromARGB(255, 0, 255, 170),
            child: Center(child: Text('Send')),
          ),
        ),
      ],
    );
  }
}
