import 'package:equatable/equatable.dart';
import 'package:app2/models/contact.dart';

abstract class ContactsState extends Equatable {
  final List<Contact> contacts;

  const ContactsState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactsLoaded extends ContactsState {
  const ContactsLoaded({required super.contacts});
}

class ContactsLoading extends ContactsState {
  const ContactsLoading({super.contacts = const []});
}

class ContactsError extends ContactsState {
  final String errorMessage;

  const ContactsError({required this.errorMessage, super.contacts = const []});

  @override
  List<Object> get props => [errorMessage, contacts];
}
