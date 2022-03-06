import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/about/widgets/about_screen.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/main_chat_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WhatsappClone',
      theme: ThemeData(
        primarySwatch: CustomPrimaryColor.whatsappTeal,
      ),
      home: Builder(builder: (context) => MainChatListPage()),
      getPages: [
        GetPage(name: '/about', page: () => (AboutScreen()))
      ],
    );
  }
}
