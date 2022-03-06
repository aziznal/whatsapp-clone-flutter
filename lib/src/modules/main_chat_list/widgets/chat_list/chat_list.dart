import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 56.0),
      children: getChatItemWidgets(),
    );
  }

  List<ChatItemWidget> getChatItemWidgets() {
    return MockData.chats
        .map((chat) => ChatItemWidget(chatItemData: chat))
        .toList();
  }
}
