import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_loading_spinner.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_item.dart';

class ContactList extends StatefulWidget {
  const ContactList({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  var controller = Get.find<ItemListController<Contact>>();

  @override
  Widget build(BuildContext context) {
    return getLoadedContacts();
  }

  Widget getLoadedContacts() {
    return Obx(
      () {
        if (controller.isLoading.isTrue) {
          return CustomLoadingSpinner();
        }

        return ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ContactItemWidget(contactData: controller.items[index]);
          },
        );
      },
    );
  }
}
