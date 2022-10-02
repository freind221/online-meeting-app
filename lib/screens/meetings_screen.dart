import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zome_clone/resources/jitsi_meeting_method.dart';
import 'package:zome_clone/widgets/meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMethod jitsiMethod = JitsiMethod();

  createNewMeeting() {
    var rand = Random();
    String roomName = (rand.nextInt(100000000) + 10000000).toString();
    jitsiMethod.createMeeting(
        roomName: roomName, isAudioMuted: false, isVideoMuted: false);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-screen');
  }

  @override
  void dispose() {
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MeetingButton(
              title: 'New Meeting',
              onPressed: createNewMeeting,
              icon: Icons.emergency_recording_sharp),
          MeetingButton(
              title: 'Join Meeting',
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box),
          MeetingButton(
              title: 'Schedule',
              onPressed: () {},
              icon: Icons.schedule_rounded),
          MeetingButton(
              title: 'Share Screen', onPressed: () {}, icon: Icons.arrow_upward)
        ],
      ),
    );
  }
}
