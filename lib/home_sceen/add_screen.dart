import 'package:clone_note/database/databaseUtils.dart';
import 'package:flutter/material.dart';


class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff3B3B3B),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: const Text(
          'Add Note',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                saveNotes(context);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff3B3B3B),
                ),
                child: const Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9A9A9A),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Type something...',
                hintStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9A9A9A),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void saveNotes(context) async{
    DatabaseUtils.insertNoteIntoDB(title: titleController.text, description: descriptionController.text);
    setState(() {

    });
    titleController.text = descriptionController.text = '';
    Navigator.pop(context);


  }

}
