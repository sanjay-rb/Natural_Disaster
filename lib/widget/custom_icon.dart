import 'package:flutter/material.dart';
import '../constants/responsiveness.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: Responsiveness.width(35),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          gradient: RadialGradient(
            colors: [
              Colors.green.shade50,
              Colors.green.shade300,
            ],
          ),
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
