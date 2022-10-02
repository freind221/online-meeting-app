import 'package:flutter/material.dart';
import 'package:zome_clone/resources/auth_method.dart';
import 'package:zome_clone/utilis/toast.dart';
import 'package:zome_clone/widgets/button.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
  final AuthMethod authMethod = AuthMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            authMethod.firebaseAuth.signOut();
          },
          child: const Text('Sign Out')),
    ));
  }
}
