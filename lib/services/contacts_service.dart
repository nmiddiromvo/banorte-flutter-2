import 'dart:convert';
import 'package:app2/models/contact.dart';
import 'package:http/http.dart' as http;

class ContactsService {
  Future<List<Contact>> loadContacts() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<Contact> contacts =
          (jsonData['results'] as List).map((contactJson) {
        return Contact.fromMap(contactJson);
      }).toList();

      return contacts;
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  Future<Contact> updatePocket(Contact contact) async {
    await Future.delayed(const Duration(seconds: 2));

    return contact.copyWith(
      firstName: "${contact.firstName} edited",
    );
  }

  Future<bool> deletePocket(Contact contact) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
