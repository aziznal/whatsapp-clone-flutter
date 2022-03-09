import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/add_new_chat/widgets/contact_list/contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 56.0),
      children: getContactItemWidgets(),
    );
  }

  List<ContactItemWidget> getContactItemWidgets() {
    return MockData.contacts
        .map((contact) => ContactItemWidget(contactData: contact))
        .toList();
  }
}
