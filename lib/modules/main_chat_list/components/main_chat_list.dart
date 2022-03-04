import 'package:flutter/material.dart';

import 'package:whatsapp_clone/modules/common/components/custom_app_bar.dart';

class MainChatListPage extends StatefulWidget {
  const MainChatListPage({Key? key}) : super(key: key);

  @override
  State<MainChatListPage> createState() => _MainChatListPageState();
}

class _MainChatListPageState extends State<MainChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "WhatsappClone"),
      body: const Center(
        child: Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Coming Soon!"),
            action: SnackBarAction(
              label: "hide",
              onPressed: () {},
            ),
          ));
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
