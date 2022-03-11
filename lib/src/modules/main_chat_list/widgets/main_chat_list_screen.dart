import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/models/main_chat_list_menu_item.enum.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list/chat_list.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/new_chat_fab.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

class MainChatListScreen extends GetView<MainChatListController> {
  MainChatListScreen({Key? key}) : super(key: key);

  // TODO: move logic into Controller

  @override
  MainChatListController controller = Get.put(MainChatListController());

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
      body: controller.obx(
        (state) {
          return ChatList(chats: state);
        },
        onLoading: CustomLoadingSpinner(),
      ),
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

class MainChatListController extends GetxController
    with StateMixin<List<Chat>> {
  RxList<Chat> chats = RxList<Chat>();

  @override
  onInit() {
    super.onInit();
    loadChats();

    listenToListUpdate();
  }

  void listenToListUpdate() {
    chats.listen((p0) {
      update();
    });
  }

  loadChats() {
    return ChatService.getAllChats().then(
      (loadedChats) {
        chats.addAll(loadedChats);
        change(chats, status: RxStatus.success());
      },
    ).onError(
      (error, stackTrace) {
        change(chats, status: RxStatus.error());
      },
    );
  }

  addNewChat(Chat newChat) {
    chats.add(newChat);
  }
}
