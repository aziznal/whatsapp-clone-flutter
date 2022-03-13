import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';

class MessageSendFieldWidget extends StatelessWidget {
  MessageSendFieldWidget({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 90,
          child: createMessageSendField(),
        ),
        Expanded(
          flex: 12,
          child: createSendButton(context),
        ),
      ],
    );
  }

  Widget createSendButton(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => {},
      elevation: 2.0,
      fillColor: CustomPrimaryColor.whatsappTeal.shade300,
      child: Icon(
        Icons.send,
        size: 24.0,
        color: Colors.white,
      ),
      shape: CircleBorder(),
    );
  }

  Widget createMessageSendField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: SizedBox(
          height: 45,
          child: TextField(
            controller: textController,
            style: TextStyle(
              fontSize: 17,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
