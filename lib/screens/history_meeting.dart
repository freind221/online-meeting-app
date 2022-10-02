import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zome_clone/resources/firebase_method.dart';

class HistoryMeetings extends StatefulWidget {
  const HistoryMeetings({Key? key}) : super(key: key);

  @override
  State<HistoryMeetings> createState() => _HistoryMeetingsState();
}

class _HistoryMeetingsState extends State<HistoryMeetings> {
  final FireBaseMethod fireBaseMethod = FireBaseMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: fireBaseMethod.firestoreData,
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                        "Room Name :  ${snapshot.data!.docs[index]['meetingName']}"),
                    subtitle: Text(
                        "Joined at : ${DateFormat.yMMMd().format(snapshot.data!.docs[index]['createdAt'].toDate())}"),
                  );
                }));
          })),
    );
  }
}
