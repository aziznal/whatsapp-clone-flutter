import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_list.dart';

class AddNewChatScreen extends StatelessWidget {
  const AddNewChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Add New Chat',
        actions: [
          getAppBarSearchAction(context),
        ],
      ),
      body: ContactList(),
    );
  }

  Widget getAppBarSearchAction(BuildContext context) {
    return IconButton(
      onPressed: () {
        showComingSoonSnackBar(context);
      },
      icon: const Icon(Icons.search),
    );
  }
}
