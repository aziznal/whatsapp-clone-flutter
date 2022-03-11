import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';
import 'package:permission_handler/permission_handler.dart';

class NewChatFAB extends StatelessWidget {
  const NewChatFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        PermissionStatus contactsPermission = await _getContactsPermission();

        if (contactsPermission.isGranted) {
          await Get.toNamed(ScreenRoutes.addNewChat);
        }
      },
      child: const Icon(Icons.message),
    );
  }

  Future<PermissionStatus> _getContactsPermission() async {
    return Permission.contacts.request();
  }
}
