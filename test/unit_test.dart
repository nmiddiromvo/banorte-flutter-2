import 'package:app2/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:app2/bloc/contacts_bloc/contacts_event.dart';
import 'package:app2/bloc/contacts_bloc/contacts_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('ContactsBloc', () {
    test('initial state is correct', () {
      expect(
        ContactsBloc().state,
        const ContactsLoading(),
      );
    });

    blocTest<ContactsBloc, ContactsState>(
      'emits [isLoading: true] when LoadContactsEvent is added',
      build: () => ContactsBloc(),
      act: (bloc) => bloc.add(LoadContactsEvent()),
      expect: () => [
        const ContactsLoading(),
      ],
    );

    blocTest<ContactsBloc, ContactsState>(
      'emits [isLoading: true] then success state when LoadContactsEvent is added',
      build: () => ContactsBloc(),
      act: (bloc) => bloc.add(LoadContactsEvent()),
      wait: const Duration(seconds: 2),
      // espero el tiempo que suponemos que tarda en responder la API
      expect: () => [
        const ContactsLoading(),
        isA<ContactsLoaded>(),
      ],
    );
  });
}
