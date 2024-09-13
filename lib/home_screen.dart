import 'package:app2/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:app2/bloc/contacts_bloc/contacts_event.dart';
import 'package:app2/bloc/contacts_bloc/contacts_state.dart';
import 'package:app2/styles/app_text_styles.dart';
import 'package:app2/widgets/new_contact_button.dart';
import 'package:app2/widgets/no_contacts_widget.dart';
import 'package:app2/widgets/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ContactsBloc>(context).add(LoadContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.9;
    final minHeight = MediaQuery.of(context).size.height * 0.6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(250, 0, 255, 1),
            child: Text(
              'AB',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 16 / 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        leadingWidth: 64,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/notification.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/small-bineo-icon.svg'),
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: maxHeight,
        minHeight: minHeight,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: _body(),
        panelBuilder: (sc) => _panel(context, sc),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
    );
  }
}

Widget _body() {
  return Column(
    children: [
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transferencias',
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: 23),
            Row(
              children: [
                Expanded(
                  child: OptionButton(
                    onTap: () {
                      print('tapped 1');
                    },
                    title: 'Transferir',
                    svgPath: 'assets/move-money.svg',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OptionButton(
                    onTap: () {
                      print('tapped 2');
                    },
                    title: 'Pagar',
                    svgPath: 'assets/cash-payment.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OptionButton(
                    onTap: () {
                      print('tapped 1');
                    },
                    title: 'Retirar',
                    svgPath: 'assets/cash-out-white.svg',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OptionButton(
                    onTap: () {
                      print('tapped 2');
                    },
                    title: 'Depositar',
                    svgPath: 'assets/cash-in-white.svg',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _panel(BuildContext context, ScrollController sc) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 38, 40, 1),
              Color.fromRGBO(31, 34, 35, 1)
            ],
          ),
        ),
        child: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, state) {
            if (state is ContactsLoading) {
              return const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white, strokeAlign: 0),
                ),
              );
            }

            if (state is ContactsError) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(state.errorMessage),
                ),
              );
            }

            if (state is ContactsLoaded && state.contacts.isEmpty) {
              return const NoContactsWidget();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contactos', style: AppTextStyles.heading3),
                const SizedBox(height: 20),
                const NewContactButton(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return Text(
                        state.contacts[index].email,
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ));
}
