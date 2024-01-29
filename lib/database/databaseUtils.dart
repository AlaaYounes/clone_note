import 'package:sqflite/sqflite.dart';

class DatabaseUtils {
   Database? database;
   List notes = [];
   void createDatabase() async {
    await openDatabase(
      'cloneNoteApp.db',
      version: 1,
      onCreate: (db, version) {
        print('databse created');
        try {
          db.execute(
              'CREATE TABLE NOTE(id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
          print('table inserted successfully');
        } catch (e) {
          print('error when creating table ${e.toString()}');
        }
      },
      onOpen: (db) {
        print('database opened');
        database = db;
        getNotesFromBD();
      },
    );
  }

   insertNoteIntoDB({
    required String title,
    required String description,
  }) async {
    await database?.transaction((txn) async {
      try {
        int value = await txn
            .rawInsert(
                'INSERT INTO note(title, description) VALUES("$title", "$description")')
            .then((value) {
              return getNotesFromBD();
            });
        print('$value inserted Successfully.');
        getNotesFromBD();
      } catch (e) {
        print('error when inserting new record ${e.toString()}');
      }
    });
  }

   getNotesFromBD() async {
    try {
      notes = await database!.rawQuery('SELECT * FROM note');
      print('hello');
    } catch (e) {
      print(e.toString());
    }
  }

   deleteNoteFromDB({required int id}) async {
    try {
      await database?.rawDelete('DELETE FROM note WHERE id = ?', [id]);
      getNotesFromBD();
    } catch (e) {
      print(e.toString());
    }
  }
}
