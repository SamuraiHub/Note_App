import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'note.dart';

class NoteController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  Future<User?> getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    loggedInUser = (await getCurrentUser())!;
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection(loggedInUser.email!).get();

    notes.value = querySnapshot.docs
        .map((m) => Note.fromJson(m.data() as Map<String, dynamic>))
        .toList();
  }

  void deleteNoteFromDB(int id) async {
    var collection = _firestore.collection(loggedInUser.email!);
    collection.doc('Document$id').delete();
  }

  void addNoteToDB() async {
    var collection = _firestore.collection(loggedInUser.email!);
    collection
        .doc('Document${notes.value.last.id}')
        .set(notes.value.last.toJson());
  }

  void updateNoteInDB(Note note) async {
    var collection = _firestore.collection(loggedInUser.email!);
    collection
        .doc('Document${note.id}') // <-- Doc ID where data should be updated.
        .update(note.toJson());
  }
}
