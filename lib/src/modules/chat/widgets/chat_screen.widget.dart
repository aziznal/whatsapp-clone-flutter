import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/chat_screen_parameters.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

class ChatController extends GetxController {
  RxBool isLoading = true.obs;
  Chat? chat;

  loadChatById(String chatId) async {
    chat = await ChatService.getChatById(chatId);
    isLoading(false);
  }
}

class ChatScreen extends StatelessWidget {
  late final String chatId;

  final controller = Get.put(ChatController());

  ChatScreen({
    Key? key,
  }) : super(key: key) {
    chatId = getChatIdFromParams();
    controller.loadChatById(chatId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue
          ? CustomLoadingSpinner()
          : getLoadedScreen(),
    );
  }

  Widget getLoadedScreen() {
    return Scaffold(
      appBar: AppBar(
        title: getImageWithBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: getChatBody(),
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
              controller.chat!.contact.name,
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

  Widget getChatBody() {
    return Center(
      child: Text('loaded chat! ${controller.chat!.contact.name}'),
    );
  }
}
