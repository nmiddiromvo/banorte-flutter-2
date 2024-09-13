import 'package:app2/bloc/contacts_bloc/contacts_event.dart';
import 'package:app2/bloc/contacts_bloc/contacts_state.dart';
import 'package:app2/services/contacts_service.dart';
import 'package:app2/models/contact.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsService contactsService = ContactsService();

  ContactsBloc() : super(const ContactsLoading()) {
    on<LoadContactsEvent>(_loadContactsEvent);
    on<UpdateContactsEvent>(_updateContactsEvent);
    on<DeleteContactsEvent>(_deleteContactsEvent);
  }

  Future<void> _loadContactsEvent(event, emit) async {
    try {
      emit(ContactsLoading(contacts: state.contacts));
      final contacts = await contactsService.loadContacts();

      emit(ContactsLoaded(contacts: contacts));
    } catch (error) {
      emit(
        ContactsError(
          errorMessage: 'Load Data error: $error',
          contacts: state.contacts,
        ),
      );
    }
  }

  Future<void> _updateContactsEvent(
      UpdateContactsEvent event, Emitter<ContactsState> emit) async {
    try {
      final updatedPocket = await contactsService.updatePocket(event.contact);

      if (state.contacts.isEmpty) {
        emit(ContactsLoaded(contacts: [updatedPocket]));
      } else {
        List<Contact> updateContacts(List<Contact> contacts) => contacts
            .map((contact) =>
                contact.email == updatedPocket.email ? updatedPocket : contact)
            .toList();

        emit(ContactsLoaded(contacts: updateContacts(state.contacts)));
      }
    } catch (e) {
      emit(const ContactsError(errorMessage: 'Error'));
    }
  }

  Future<void> _deleteContactsEvent(
    DeleteContactsEvent event,
    Emitter<ContactsState> emit,
  ) async {
    try {
      final isDeleted = await contactsService.deletePocket(event.contact);
      if (isDeleted) {
        final contactList = [...state.contacts];

        final newContactList = contactList
            .where((contact) => contact.email != event.contact.email)
            .toList();

        emit(ContactsLoaded(contacts: newContactList));
      } else {
        throw Exception();
      }
    } catch (e) {
      emit(const ContactsError(errorMessage: 'Error al eliminar el contact'));
    }
  }
}
