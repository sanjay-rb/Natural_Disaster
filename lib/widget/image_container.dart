import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/responsiveness.dart';

import '../model/character.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: character.color,
                width: Responsiveness.width(5),
              ),
              gradient: RadialGradient(
                colors: [
                  character.color.shade50,
                  character.color.shade300,
                ],
              ),
            ),
            child: Image.asset(
              character.gifPath,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Responsiveness.width(5)),
              child: Text(
                character.name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: character.color.shade900,
                    ),
              ),
            ),
          ),
          if (!character.isUnlocked)
            Container(
              color: Colors.black38,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: Responsiveness.width(15),
                  ),
                ),
              ),
            ),
          if (character.isSelected)
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.amber,
                  width: 3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
