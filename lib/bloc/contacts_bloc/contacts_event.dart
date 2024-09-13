import 'package:app2/models/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ContactsEvent extends Equatable {
  const ContactsEvent();
}

@immutable
class LoadContactsEvent extends ContactsEvent {
  @override
  List<Object> get props => [];
}

@immutable
class UpdateContactsEvent extends ContactsEvent {
  final Contact contact;

  const UpdateContactsEvent({required this.contact});

  @override
  List<Object> get props => [contact];
}

@immutable
class DeleteContactsEvent extends ContactsEvent {
  final Contact contact;

  const DeleteContactsEvent({required this.contact});

  @override
  List<Object> get props => [contact];
}
