import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/services/contacts.service.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_list.dart';

class AddNewChatScreen extends StatelessWidget {
  AddNewChatScreen({Key? key}) : super(key: key);

  final ItemListController<Contact> controller = Get.put(
    ItemListController<Contact>(
      itemLoaderMethod: () => ContactsService.getAllContacts(),
    ),
  );

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
