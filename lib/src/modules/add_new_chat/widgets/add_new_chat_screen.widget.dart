import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/controllers/add_new_chat.controller.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/services/contacts.service.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_list.widget.dart';

/// Displays list of contacts that user can click to add new chat
class AddNewChatScreen extends StatelessWidget {
  AddNewChatScreen({Key? key}) : super(key: key);

  final contactListController = Get.put(
    ItemListController<Contact>(
      itemLoaderMethod: () => ContactsService.getAllContacts(),
    ),
  );

  final contactItemController = Get.put(ContactItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (contactItemController.isLoading.isTrue) {
          return _showLoadingScreen();
        }

        return _createContactsList(context);
      },
    );
  }

  /// Shows loading screen with dynamic loading text
  ///
  /// Text will change according to whether user is creating a new chat or
  /// simply navigating to an existing one
  Widget _showLoadingScreen() {
    return Scaffold(
      body: CustomLoadingSpinner(
        loadingText: contactItemController.isCreatingNewChat.isTrue
            ? 'Creating New Chat...'
            : 'Loading Chat...',
      ),
    );
  }

  /// Creates and returns contact list screen (including app bar)
  Widget _createContactsList(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Add New Chat',
        actions: [
          _createAppBarSearchAction(context),
        ],
      ),
      body: ContactList(),
    );
  }

  Widget _createAppBarSearchAction(BuildContext context) {
    return IconButton(
      onPressed: () {
        showComingSoonSnackBar(context);
      },
      icon: const Icon(Icons.search),
    );
  }
}
