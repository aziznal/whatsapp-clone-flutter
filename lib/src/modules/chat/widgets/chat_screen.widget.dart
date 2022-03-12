import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/chat_screen_parameters.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

/// Manages loading chat data and screen loading state
class ChatController extends GetxController {
  var isLoading = true.obs;
  Chat? chat;

  /// Returns chatId param value
  /// 
  /// Throws [ArgumentError] if chatId is null
  String _getChatIdFromParams() {
    String? chatId = Get.parameters[ChatScreenParameters.chatId];

    if (chatId == null) {
      Get.back();
      throw ArgumentError('No value for chatId was detected', 'chatId');
    }

    return chatId;
  }

  /// Assigns value to [chat] using service
  void loadChat() async {
    String chatId = _getChatIdFromParams();

    chat = await ChatService.fetchChatById(chatId);
    isLoading(false);
  }
}

class ChatScreen extends StatelessWidget {
  final controller = Get.put(ChatController());

  ChatScreen({
    Key? key,
  }) : super(key: key) {
    controller.loadChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getImageWithBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? CustomLoadingSpinner(loadingText: 'Loading Chat...',)
            : createChatScreen(),
      ),
    );
  }

  Widget createChatScreen() {
    return getChatBody();
  }

  /// Displays contact name if chat has been loaded. Displays 'Loading' otherwise.
  Widget getImageWithBackButton() {
    return Obx(
      () => Row(
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
                controller.isLoading.isTrue
                    ? 'Loading'
                    : controller.chat!.contact.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ].addHorizontalPadding(4),
          ),
        ],
      ),
    );
  }

  Widget getChatBody() {
    return Center(
      child: Text('loaded chat! ${controller.chat!.contact.name}'),
    );
  }
}
