import 'package:flutter/material.dart';
import 'package:zome_clone/utilis/colors.dart';

class MeetingButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  const MeetingButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(20)),
              child: Icon(icon),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
