import 'package:byte_bank/components/progress_indicator.dart';
import 'package:byte_bank/dao/contact_dao.dart';
import 'package:byte_bank/model/contact.dart';
import 'package:byte_bank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final ContactDAO _dao = ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressIndicatorCircle();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              // if (snapshot.hasData) {
                final List<Contact> contacts = snapshot.data!;

                return ListView.builder(
                  itemBuilder: (context, index) =>
                      _ContactItem(contacts[index]),
                  itemCount: contacts.length,
                );
              // }
              // return Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'No Data',
              //         style: TextStyle(fontSize: 32.0),
              //       )
              //     ],
              //   ),
              // );
          }

          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((value) => setState(() => {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.account.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
