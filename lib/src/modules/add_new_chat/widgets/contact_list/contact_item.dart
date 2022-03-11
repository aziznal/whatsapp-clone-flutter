import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';
import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

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
        Utils.executeAfterTimerHack(() async {
          if (await chatIsNotAlreadyCreated()) {
            Chat newChat = await createNewChat();
            gotoChatScreen(newChat);
          } else {
            Chat chat = await ChatService.getChatByContact(contactData.id);
            gotoChatScreen(chat);
          }
        });
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

  Future<bool> chatIsNotAlreadyCreated() async {
    return !(await ChatService.checkContactHasChat(contactData.id));
  }

  Future<Chat> createNewChat() async {
    Chat newChat = Chat(
      contact: contactData,
      messages: [],
    );

    await ChatService.addNewChat(newChat).then((_) {
      Get.find<ItemListController<Chat>>().addNewObject(newChat);
    });

    return newChat;
  }

  void gotoChatScreen(Chat newChat) {
    Get.offNamed(ScreenRoutes.chat.withChatId(newChat.id));
  }
}
