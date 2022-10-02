import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zome_clone/resources/auth_method.dart';
import 'package:zome_clone/resources/firebase_method.dart';
import 'package:zome_clone/utilis/toast.dart';

class JitsiMethod {
  final AuthMethod authMethod = AuthMethod();
  final FireBaseMethod fireBaseMethod = FireBaseMethod();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = authMethod.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        // Required, spaces will be trimmed
        ..userDisplayName = name
        ..userEmail = authMethod.user.email
        ..userAvatarURL = authMethod.user.photoURL // or .png

        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
      await fireBaseMethod.addMeetingToDatabase(roomName);
    } catch (error) {
      Utilis.toatsMessage(error.toString());
    }
  }
}
