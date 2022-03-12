import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/controllers/add_new_chat.controller.dart';

/// Displays information about a contact in the format of a basic card
class ContactItemWidget extends StatelessWidget {
  ContactItemWidget({
    required this.contact,
    Key? key,
  }) : super(key: key);

  final Contact contact;

  final controller = Get.find<ContactItemController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createImageWidget(context),
            createTitleAndSubtitle(),
          ],
        ),
      ),
      onTap: () {
        controller.gotoChatOfClickedContact(contact);
      },
      splashColor: const Color.fromARGB(255, 136, 136, 136),
    );
  }

  Widget createTitleAndSubtitle() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contact.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            contact.status,
            overflow: TextOverflow.ellipsis,
          ),
        ].addVerticalPadding(2),
      ),
    );
  }

  Widget createImageWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 60,
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image.asset(contact.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }
}
