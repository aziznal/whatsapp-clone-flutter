import 'package:com.aziznal.whatsapp_clone/src/custom/custom_icons.dart';
import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/message.model.dart';

class MessageItemWidget extends StatelessWidget {
  final Message message;

  const MessageItemWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createMessage();
  }

  Widget createMessage() {
    return Stack(
      children: [
        createMessageBody(),
        createMessageTriangleIndicator(),
      ],
    );
  }

  Widget createMessageBody() {
    return Padding(
      padding: EdgeInsets.only(
        left: message.sender == MessageSender.self ? 80 : 20,
        right: message.sender == MessageSender.self ? 20 : 80,
      ),
      child: createMessageBodyAndDate(),
    );
  }

  Positioned createMessageTriangleIndicator() {
    return Positioned(
      left: message.sender == MessageSender.self ? null : 4,
      right: message.sender == MessageSender.self ? 4 : null,
      top: 0.5,
      child: Transform.scale(
        scaleX: message.sender == MessageSender.self ? -1 : 1,
        child: Icon(
          CustomIcons.message_indicator,
          color: message.sender == MessageSender.self
              ? BasicColors.sentMessageColor
              : BasicColors.receivedMessageColor,
          size: 17,
        ),
      ),
    );
  }

  Widget createMessageBodyAndDate() {
    return Row(
      mainAxisAlignment: message.sender == MessageSender.self
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: message.sender == MessageSender.self
                ? BasicColors.sentMessageColor
                : BasicColors.receivedMessageColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 185, 185, 185),
                blurRadius: 2,
                spreadRadius: 0.5,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              createMessageBodyText(),
              createMessageDateText(),
            ],
          ),
        ),
      ],
    );
  }

  Widget createMessageBodyText() {
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Text(message.body),
    );
  }

  Row createMessageDateText() {
    return Row(
      children: [
        Text(
          '${message.dateSent.hour}:${message.dateSent.second}',
          style: TextStyle(
            color: Color.fromARGB(255, 119, 119, 119),
            fontSize: 11,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
