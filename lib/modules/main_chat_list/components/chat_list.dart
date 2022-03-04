import 'package:flutter/material.dart';

import 'package:whatsapp_clone/modules/common/components/coming_soon_snackbar.dart';

import 'package:whatsapp_clone/modules/common/models/chat_item.dart';

import 'package:whatsapp_clone/modules/common/mock/mock_data.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 56.0),
      children: MockData.chats
          .map((chat) => ChatItemWidget(chatItemData: chat))
          .toList(),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    required this.chatItemData,
    Key? key,
  }) : super(key: key);

  final ChatItem chatItemData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image Column
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 60,
                margin: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300.0),
                  child: Image.asset('assets/images/app-icon.png'),
                ),
              ),
              onTap: () => showComingSoonSnackBar(context),
            ),
      
            // Title & Subtitle
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chatItemData.title, textAlign: TextAlign.start),
                  Text(chatItemData.subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
