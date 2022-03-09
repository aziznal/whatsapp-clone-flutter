import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NewChatFAB extends StatelessWidget {
  const NewChatFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(ScreenRoutes.addNewChat);
      },
      child: const Icon(Icons.message),
    );
  }
}
