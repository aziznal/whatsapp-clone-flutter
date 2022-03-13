import 'package:com.aziznal.whatsapp_clone/src/modules/chat/widgets/message_box.widget.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/controllers/chat.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/chat/widgets/message_list/message_list.widget.dart';

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
            ? CustomLoadingSpinner(
                loadingText: 'Loading Chat...',
              )
            : createChatScreen(),
      ),
    );
  }

  Widget createChatScreen() {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/chat-background.jpg'),
              fit: BoxFit.cover,
              opacity: 0.4),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: MessageList(
                messages: controller.chat!.messages,
              ),
            ),
            Expanded(
              flex: 1,
              child: MessageSendFieldWidget(),
            ),
          ],
        ));
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
