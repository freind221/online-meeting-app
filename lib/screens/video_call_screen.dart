import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zome_clone/resources/auth_method.dart';
import 'package:zome_clone/resources/jitsi_meeting_method.dart';
import 'package:zome_clone/utilis/colors.dart';
import 'package:zome_clone/widgets/mute_switch.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethod authMethod = AuthMethod();
  final JitsiMethod jitsiMethod = JitsiMethod();
  late final TextEditingController meetingController;
  late final TextEditingController nameController;
  bool isAudioMuted = false;
  bool isVideoMuted = false;

  @override
  void initState() {
    meetingController = TextEditingController();
    nameController = TextEditingController(text: authMethod.user.displayName);
    super.initState();
  }

  joinMeeting() {
    jitsiMethod.createMeeting(
        roomName: meetingController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  void dispose() {
    meetingController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Join the Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: meetingController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                hintText: 'Room ID',
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                hintText: 'Name',
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MuteSwitches(
              title: 'Mute Audio',
              value: isAudioMuted,
              onChange: onAudioChange),
          MuteSwitches(
              title: 'Mute Audio', value: isVideoMuted, onChange: onVideoChange)
        ],
      ),
    );
  }

  onAudioChange(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoChange(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
