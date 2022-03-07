import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/custom_app_bar.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

class AddNewChatScreen extends StatelessWidget {
  const AddNewChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Add New Chat',
      ),
      body: getContactList(),
    );
  }

  Widget getContactList() {
    return ListView(
      children: MockData.contacts.map((contact) => getContactWidget(contact)).toList().addVerticalSpacing(4),
    );
  }

  Widget getContactWidget(Contact contactData) {
    return Text(contactData.name);
  }
}
