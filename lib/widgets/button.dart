import 'package:flutter/material.dart';
import 'package:zome_clone/utilis/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  const CustomButton(
      {Key? key, required this.title, required this.onPressed, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: buttonColor,

            //Here we are giving widt and height to our button

            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: buttonColor),
                borderRadius: BorderRadius.circular(30))),
        child: isLoading!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                title,
                style: const TextStyle(fontSize: 17),
              ),
      ),
    );
  }
}
