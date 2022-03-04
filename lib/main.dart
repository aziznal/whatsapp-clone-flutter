import 'package:flutter/material.dart';
import 'package:whatsapp_clone/modules/main_chat_list/main_chat_list.dart';

import 'theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsappClone',
      theme: ThemeData(
        primarySwatch: CustomPrimaryColor.whatsappTeal,
      ),
      home: const MainChatListPage(),
    );
  }
}
