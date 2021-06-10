import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/game_audios.dart';
import 'package:natural_disaster/constants/responsiveness.dart';

class CustomTextButton extends StatelessWidget {
  final Function onTap;

  final String text;
  final bool isIconFirst;
  final IconData icon;
  const CustomTextButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.isIconFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        GameAudio.tapSound();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: Responsiveness.width(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 0.5,
              spreadRadius: 0.5,
            )
          ],
          gradient: RadialGradient(
            colors: [
              Colors.green.shade50,
              Colors.green.shade300,
            ],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isIconFirst) ...[
              Icon(icon),
              Text(text),
            ] else ...[
              Text(text),
              Icon(icon),
            ]
          ],
        ),
      ),
    );
  }
}
