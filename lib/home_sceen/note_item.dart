import 'package:clone_note/database/databaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteItem extends StatefulWidget {
  Map note;
  NoteItem({super.key, required this.note});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              DatabaseUtils.deleteNoteFromDB(id: widget.note['id']);
              setState(() {});
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
        child: Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.note['title'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
