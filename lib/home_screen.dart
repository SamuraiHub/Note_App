import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'note_controller.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => HomeScreen());

  var noteController = Get.put(NoteController());
  RxBool unfold = false.obs;
  RxInt edit_index = 0.obs;
  RxBool edit_bool = false.obs;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Obx(
              () => Text(
                noteController.notes.value.length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: noteController.notes.value.length,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.blueGrey,
          ),
          itemBuilder: (context, index) => Obx(
            () => ListTile(
                trailing: Obx(
                  () => index == edit_index.value && edit_bool.value
                      ? SizedBox(
                          width: 110.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  noteController.deleteNote(
                                      noteController.notes.value[index].id);
                                  noteController.notes.removeAt(index);
                                  edit_index.value = 0;
                                  edit_bool.value = false;
                                },
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ),
                title: Text(noteController.notes.value[index].title!),
                subtitle: Obx(
                  () => Visibility(
                    child: Text(noteController.notes.value[index].content!),
                    visible: !unfold.value,
                  ),
                ),
                onTap: () {},
                onLongPress: () {
                  if (index == edit_index.value)
                    edit_bool.value = !edit_bool.value;
                  else {
                    edit_index.value = index;
                    edit_bool.value = true;
                  }
                }),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => FloatingActionButton(
                heroTag: "btn1",
                child:
                    unfold.value ? Icon(Icons.menu) : Icon(Icons.unfold_less),
                tooltip: unfold.value
                    ? 'show more. reveals notes content'
                    : 'Show less. Hide notes content',
                onPressed: () {
                  unfold.value = !unfold.value;
                }),
          ),
          /* Notes: for the "Show More" icon use: Icons.menu */

          FloatingActionButton(
            heroTag: "btn2",
            child: const Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
