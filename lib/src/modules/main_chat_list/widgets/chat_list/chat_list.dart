import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.chats}) : super(key: key);

  final List<Chat>? chats;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 56.0),
      children: getChatItemWidgets(),
    );
  }

  List<ChatItemWidget> getChatItemWidgets() {
    if (chats == null) {
      return [];
    } else {
      return chats!.map((chat) => ChatItemWidget(chatItemData: chat)).toList();
    }
  }
}
