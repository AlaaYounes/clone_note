
import 'package:clone_note/database/databaseUtils.dart';
import 'package:clone_note/home_sceen/add_screen.dart';
import 'package:clone_note/home_sceen/note_item.dart';
import 'package:clone_note/home_sceen/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List notes = [];
  @override
void initState() {
    DatabaseUtils.getNotesFromBD();
    super.initState();
  }
  getData()async{
    notes = await DatabaseUtils.getNotesFromBD();
  }
  Widget build(BuildContext context) {
notes = DatabaseUtils.notes;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff252525),
          title: const Text(
            'Notes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff3B3B3B),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff252525),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 7),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowNoteScreen(
                                  note: notes[index],
                                )),
                      );
                    },
                    child: NoteItem(
                      note: notes[index],
                    )),
              ),
          itemCount: notes.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff252525),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Color(0xff252525),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddScreen()),
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  // }
  // getData()async{
  //   await DatabaseUtils.getNotesFromBD(widget.database);
  //   setState(() {
  //
  //   });
  // }
}
