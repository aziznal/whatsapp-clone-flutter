import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';
import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_item.widget.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  var controller = Get.find<ItemListController<Chat>>();

  @override
  Widget build(BuildContext context) {
    return getLoadedChatList();
  }

  Widget getLoadedChatList() {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return CustomLoadingSpinner();
      }

      return ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return ChatItemWidget(chatItemData: controller.items[index]);
        },
      );
    });
  }

  // List<ChatItemWidget> getChatItemWidgets() {
  //   if (chats == null) {
  //     return [];
  //   } else {
  //     return chats!.map((chat) => ChatItemWidget(chatItemData: chat)).toList();
  //   }
  // }
}
