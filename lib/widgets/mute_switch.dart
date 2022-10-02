import 'package:flutter/material.dart';
import 'package:zome_clone/utilis/colors.dart';

class MuteSwitches extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChange;
  const MuteSwitches(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryBackgroundColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Mute Audio'),
          ),
          Switch.adaptive(value: value, onChanged: onChange)
        ],
      ),
    );
  }
}
