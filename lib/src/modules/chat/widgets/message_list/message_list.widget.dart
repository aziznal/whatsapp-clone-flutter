import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/message.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/widgets/message_list/message_item.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: BasicColors.messageListBackground,
      child: ListView(
        children: getMessageItemWidgets().addBottomPadding(8.0),
      ),
    );
  }

  List<MessageItemWidget> getMessageItemWidgets() {
    return messages
        .map(
          (message) => MessageItemWidget(
            message: message,
          ),
        )
        .toList();
  }
}
