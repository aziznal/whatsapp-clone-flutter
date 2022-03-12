import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/controllers/add_new_chat.controller.dart';

class ContactItemWidget extends StatelessWidget {
  ContactItemWidget({
    required this.contactData,
    Key? key,
  }) : super(key: key);

  final Contact contactData;

  final controller = Get.put(ContactItemController());

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
        controller.gotoChatOfClickedContact(contactData);
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
            contactData.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            contactData.status,
            overflow: TextOverflow.ellipsis,
          ),
        ].addVerticalSpacing(2),
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
          child: Image.asset(contactData.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }
}
