import 'package:flutter/material.dart';
import 'package:zome_clone/resources/auth_method.dart';
import 'package:zome_clone/utilis/toast.dart';
import 'package:zome_clone/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethod authMethod = AuthMethod();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            isLoading: loading,
            title: "Login",
            onPressed: () async {
              setState(() {
                loading = true;
              });
              bool res = await authMethod.signInWithGoogle();
              if (res) {
                setState(() {
                  loading = false;
                });
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/home');
              } else {
                setState(() {
                  loading = false;
                });
                Utilis.toatsMessage('Some Error occured');
              }
            },
          )
        ],
      )),
    );
  }
}
