import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/models/main_chat_list_menu_item.enum.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_list.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/new_chat_fab.widget.dart';

/// Includes app bar with options and a chat list displaying all the user's current chats
class MainChatListScreen extends GetView<ItemListController> {
  MainChatListScreen({Key? key}) : super(key: key);

  @override
  final ItemListController<Chat> controller = Get.put(ItemListController<Chat>(
    itemLoaderMethod: () => ChatService.getAllChats(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'WhatsappClone',
        actions: [
          _createSearchAction(context),
          _createPopupMenuActions(),
        ],
      ),
      body: ChatList(),
      floatingActionButton: NewChatFAB(),
    );
  }

  Widget _createSearchAction(BuildContext context) {
    return IconButton(
      onPressed: () {
        showComingSoonSnackBar(context);
      },
      icon: const Icon(Icons.search),
    );
  }

  Widget _createPopupMenuActions() {
    return PopupMenuButton<MainChatListMenuItem>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<MainChatListMenuItem>(
            child: Text('Settings'),
            value: MainChatListMenuItem.settings,
          ),
          PopupMenuItem<MainChatListMenuItem>(
            child: Text('About'),
            value: MainChatListMenuItem.about,
            onTap: () {
              Utils.executeAfterTimerHack(
                () => Get.toNamed(ScreenRoutes.about),
              );
            },
          ),
        ];
      },
    );
  }
}
