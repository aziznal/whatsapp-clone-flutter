import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/page-params.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

class ChatScreen extends StatelessWidget {
  late final String chatId;
  late final Chat _chat;

  ChatScreen({
    Key? key,
  }) : super(key: key) {
    chatId = getChatIdFromParams();
    _chat = getChatById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getImageWithBackButton(),
        automaticallyImplyLeading: false,
      ),
    );
  }

  String getChatIdFromParams() {
    String? chatId = Get.parameters[ChatScreenParameters.chatId];

    if (chatId != null) {
      return chatId;
    } else {
      Get.back();
      throw Error();
    }
  }

  Chat getChatById() {
    return MockData.chats.firstWhere((chat) => chat.id == chatId);
  }

  Widget getImageWithBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/app-icon.png'),
              ),
            ),
            Text(
              _chat.contact.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ].addHorizontalSpacing(4),
        ),
      ],
    );
  }
}
