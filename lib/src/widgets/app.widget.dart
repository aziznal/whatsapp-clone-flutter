import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';

import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/about/widgets/about_screen.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/add_new_chat_screen.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/chat/widgets/chat_screen.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/widgets/main_chat_list_screen.widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WhatsappClone',
      theme: ThemeData(
        primarySwatch: CustomPrimaryColor.whatsappTeal,
      ),
      home: Builder(
        builder: (context) => MainChatListScreen(),
      ),
      getPages: getPageRoutes(),
    );
  }

  /// Returns list of all pages available in application as a [GetPage] list
  List<GetPage<Widget>> getPageRoutes() {
    return [
      GetPage(
        name: ScreenRoutes.addNewChat,
        page: () => (AddNewChatScreen()),
      ),
      GetPage(
        name: ScreenRoutes.chat.template,
        page: () => (ChatScreen()),
      ),
      GetPage(
        name: ScreenRoutes.about,
        page: () => (AboutScreen()),
      )
    ];
  }
}
