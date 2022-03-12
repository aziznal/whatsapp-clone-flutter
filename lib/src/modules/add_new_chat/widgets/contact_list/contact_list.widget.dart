import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_item.widget.dart';

/// Displays list of contacts retrieved from user's device contacts
class ContactList extends StatefulWidget {
  const ContactList({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

/// Creates, stores, and manages state of ContactItem widgets
class _ContactListState extends State<ContactList> {
  var controller = Get.find<ItemListController<Contact>>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return CustomLoadingSpinner(loadingText: 'Loading Contacts...',);
      }

      return createContactItemWidgets();
    });
  }

  /// Creates and returns a list of [ContactItemWidget]
  Widget createContactItemWidgets() {
    return ListView.builder(
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return ContactItemWidget(contact: controller.items[index]);
      },
    );
  }
}
