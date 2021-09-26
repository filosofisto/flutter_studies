
import 'package:byte_bank/model/contact.dart';

class ContactConverter {

  Contact toContact(Map<String, dynamic> map) {
    return Contact(
      map['id'],
      map['name'],
      map['account'],
    );
  }

  Map<String, dynamic> toMap(Contact contact, bool retId) {
    final Map<String, dynamic> contactMap = Map();

    if (retId) {
      contactMap['id'] = contact.id;
    }

    contactMap['name'] = contact.name;
    contactMap['account'] = contact.account;

    return contactMap;
  }
}