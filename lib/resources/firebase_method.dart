import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:zome_clone/utilis/toast.dart';

class FireBaseMethod {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot> get firestoreData => FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseAuth.currentUser!.uid)
      .collection('meeting')
      .snapshots();
  addMeetingToDatabase(String name) async {
    firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('meeting')
        .add({'meetingName': name, 'createdAt': DateTime.now()}).then((value) {
      Utilis.toatsMessage('Meeting is Added to Database');
    }).onError((error, stackTrace) {
      Utilis.toatsMessage(error.toString());
    });
  }
}
