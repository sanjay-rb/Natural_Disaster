import 'package:flutter/material.dart';

import '../model/character.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 5,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: character.color,
                  width: MediaQuery.of(context).size.height * 0.01,
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
                padding: const EdgeInsets.all(8.0),
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
                      size: 15,
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
      ),
    );
  }
}
