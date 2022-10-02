import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zome_clone/resources/auth_method.dart';
import 'package:zome_clone/screens/home.dart';
import 'package:zome_clone/screens/login_screen.dart';
import 'package:zome_clone/screens/video_call_screen.dart';
import 'package:zome_clone/utilis/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': ((context) => const LoginScreen()),
        '/home': (context) => const HomeScreen(),
        '/video-screen': (context) => const VideoCallScreen()
      },
      home: StreamBuilder(
        stream: AuthMethod().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
