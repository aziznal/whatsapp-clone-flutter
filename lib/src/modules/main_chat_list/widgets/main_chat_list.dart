import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/models/main_chat_list_menu_item.enum.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/chat_list.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/new_chat_fab.dart';

class MainChatListPage extends StatefulWidget {
  const MainChatListPage({Key? key}) : super(key: key);

  @override
  State<MainChatListPage> createState() => _MainChatListPageState();
}

class _MainChatListPageState extends State<MainChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'WhatsappClone',
        actions: [
          getSearchAction(context),
          getPopupMenuActions(),
        ],
      ),
      body: ChatList(),
      floatingActionButton: NewChatFAB(),
    );
  }
}

Widget getSearchAction(context) {
  return IconButton(
    onPressed: () {
      showComingSoonSnackBar(context);
    },
    icon: const Icon(Icons.search),
  );
}

Widget getPopupMenuActions() {
  return PopupMenuButton<MainChatListMenuItem>(
    itemBuilder: (BuildContext context) {
      return const [
        PopupMenuItem<MainChatListMenuItem>(
          child: Text('Settings'),
          value: MainChatListMenuItem.settings,
        ),
        PopupMenuItem<MainChatListMenuItem>(
          child: Text('About'),
          value: MainChatListMenuItem.about,
        ),
      ];
    },
  );
}
