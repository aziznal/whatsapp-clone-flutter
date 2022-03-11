import 'package:contacts_service/contacts_service.dart' as device_service;

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

class ContactsService {
  static Future<List<Contact>> getAllContacts() async {
    List<device_service.Contact> contacts =
        await device_service.ContactsService.getContacts();

    return contacts
        .where(
            (contact) => contact.phones != null && contact.phones!.isNotEmpty)
        .map(
          (contact) => Contact(
            name: contact.displayName!,
            imageAssetPath: 'assets/images/app-icon.png',
            number: contact.phones![0].value!,
            status: "Hello There! I'm utilizing WhatsappClone!",
          ),
        )
        .toList();
  }
}
