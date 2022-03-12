import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';

/// Navigates user to [AddNewChatScreen] if they have the contacts permission
///
/// Clicking the button will also prompt the user to give the contacts
/// permission if they haven't done so already. If the user denies the
/// permission, then they aren't routed to to the [AddNewChatScreen] page
class NewChatFAB extends StatelessWidget {
  const NewChatFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        PermissionStatus contactsPermission =
            await _getContactsPermissionRequestResult();

        if (contactsPermission.isGranted) {
          await Get.toNamed(ScreenRoutes.addNewChat);
        }
      },
      child: const Icon(Icons.add_comment_rounded),
    );
  }

  Future<PermissionStatus> _getContactsPermissionRequestResult() async {
    return Permission.contacts.request();
  }
}
