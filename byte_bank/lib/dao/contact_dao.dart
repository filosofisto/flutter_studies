import 'package:byte_bank/converters/contact_converter.dart';
import 'package:byte_bank/model/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {

  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account INTEGER)';

  Future<Database> getDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'byte_bank.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(ContactDAO.tableSql);
      },
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete
    );

    // return getDatabasesPath().then((dbPath) {
    //   final String path = join(dbPath, 'byte_bank.db');
    //
    //   return openDatabase(
    //     path,
    //     onCreate: (db, version) {
    //       db.execute('CREATE TABLE contacts('
    //           'id INTEGER PRIMARY KEY, '
    //           'name TEXT, '
    //           'account INTEGER)');
    //     },
    //     version: 1, /*onDowngrade: onDatabaseDowngradeDelete*/
    //   );
    // });
  }

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return db.insert('contacts', ContactConverter().toMap(contact, false));
    // return getDatabase().then((db) {
    //   return db.insert('contacts', contactToMap(contact));
    // });
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    final List<Contact> contacts = [];
    final ContactConverter contactConverter = ContactConverter();

    for (Map<String, dynamic> map in maps) {
      contacts.add(contactConverter.toContact(map));
    }

    return contacts;

    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact> contacts = [];
    //
    //     for (Map<String, dynamic> map in maps) {
    //       contacts.add(mapToContact(map));
    //     }
    //
    //     return contacts;
    //   });
    // });
  }
}
