import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:whatsapp_clone/src/modules/main_chat_list/widgets/chat_list.dart';
import 'package:whatsapp_clone/src/modules/main_chat_list/widgets/new_chat_fab.dart';

class MainChatListPage extends StatefulWidget {
  const MainChatListPage({Key? key}) : super(key: key);

  @override
  State<MainChatListPage> createState() => _MainChatListPageState();
}

class _MainChatListPageState extends State<MainChatListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(text: "WhatsappClone"),
      body: ChatList(),
      floatingActionButton: NewChatFAB(),
    );
  }
}
