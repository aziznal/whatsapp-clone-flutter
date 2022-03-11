import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/main_chat_list_screen.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget({
    required this.contactData,
    Key? key,
  }) : super(key: key);

  // TODO: move logic into Controller

  final Contact contactData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getImageWidget(context),
            getTitleAndSubtitle(),
          ],
        ),
      ),
      onTap: () {
        if (chatIsNotAlreadyCreated()) {
          createNewChat();
        }

        gotoChatScreen();
      },
      splashColor: const Color.fromARGB(255, 136, 136, 136),
    );
  }

  Widget getTitleAndSubtitle() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contactData.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            contactData.status,
            overflow: TextOverflow.ellipsis,
          ),
        ].addVerticalSpacing(2),
      ),
    );
  }

  Widget getImageWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 60,
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image.asset(contactData.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }

  bool chatIsNotAlreadyCreated() {
    return !MockData.chats.any((chat) => chat.contact == contactData);
  }

  void createNewChat() {
    Chat newChat = Chat(
      contact: contactData,
      messages: [],
    );

    ChatService.addNewChat(newChat).then((_) {
      Get.find<MainChatListController>().addNewChat(newChat);
      gotoChatScreen();
    });
  }

  void gotoChatScreen() {
    // TODO: change after implementation
    // Get.offAndToNamed(ScreenRoutes.chat.withChatId(newChat.id));
    Get.back();
  }
}
