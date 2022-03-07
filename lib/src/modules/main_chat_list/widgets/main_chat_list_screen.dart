import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/helpers.dart';
import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/models/main_chat_list_menu_item.enum.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_list.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/new_chat_fab.dart';

class MainChatListScreen extends StatelessWidget {
  MainChatListScreen({Key? key}) : super(key: key);

  final MainChatListController controller = Get.put(MainChatListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'WhatsappClone',
        actions: [
          _getSearchAction(context),
          _getPopupMenuActions(),
        ],
      ),
      body: ChatList(),
      floatingActionButton: NewChatFAB(),
    );
  }

  Widget _getSearchAction(BuildContext context) {
    return IconButton(
      onPressed: () {
        showComingSoonSnackBar(context);
      },
      icon: const Icon(Icons.search),
    );
  }

  Widget _getPopupMenuActions() {
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
              Helpers.executeAfterTimerHack(
                () => Get.toNamed('/about'),
              );
            },
          ),
        ];
      },
    );
  }
}

class MainChatListController extends GetxController {}
