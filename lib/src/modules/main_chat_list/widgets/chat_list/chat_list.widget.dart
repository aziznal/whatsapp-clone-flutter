import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_item.widget.dart';

/// Displays available chats as a list of [ChatItemWidget] items
class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  final controller = Get.find<ItemListController<Chat>>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.isTrue) {
          return CustomLoadingSpinner(loadingText: 'Loading Chats...');
        }

        return _createChatList();
      },
    );
  }

  Widget _createChatList() {
    return ListView.builder(
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return ChatItemWidget(chat: controller.items[index]);
      },
    );
  }
}
