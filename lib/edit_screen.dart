import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home_screen.dart';
import 'note.dart';
import 'note_controller.dart';

class EditScreen extends StatefulWidget {
  final int edit_mode; // 0 for view 1 for edit and 2 for add
  var noteController = Get.find<NoteController>();
  Note? selectedNote;
  EditScreen({required this.edit_mode, this.selectedNote, Key? key})
      : super(key: key) {
    if (edit_mode == 2) {
      noteController.notes.value
          .add(Note(id: noteController.notes.value.last.id + 1));
      noteController.addNoteToDB();
      selectedNote = noteController.notes.value.last;
    }
  }

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.selectedNote!.title!;
    _descriptionController.text = widget.selectedNote!.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: widget.edit_mode == 0
            ? Text('View Note')
            : widget.edit_mode == 1
                ? Text("Edit Note")
                : Text("Add new Note"),
        actions: [
          Visibility(
            visible: widget.edit_mode != 0,
            child: IconButton(
                icon: const Icon(
                  Icons.check_circle,
                  size: 30,
                ),
                onPressed: () {
                  widget.selectedNote!.title = _titleController.text;
                  widget.selectedNote!.content = _descriptionController.text;
                  widget.noteController.updateNoteInDB(widget.selectedNote!);
                  widget.noteController.notes.refresh();
                  Navigator.pop(context, HomeScreen.route());
                }),
          ),
          IconButton(
              icon: const Icon(
                Icons.cancel_sharp,
                size: 30,
              ),
              onPressed: () {
                if (widget.edit_mode == 2) {
                  widget.noteController.deleteNoteFromDB(
                      widget.noteController.notes.value.last.id);
                  widget.noteController.notes.removeLast();
                }
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              initialValue: null,
              enabled: true,
              readOnly: widget.edit_mode == 0,
              decoration: const InputDecoration(
                hintText: 'Type the title here',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextFormField(
                  controller: _descriptionController,
                  enabled: true,
                  readOnly: widget.edit_mode == 0,
                  initialValue: null,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: 'Type the description',
                  ),
                  onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}
