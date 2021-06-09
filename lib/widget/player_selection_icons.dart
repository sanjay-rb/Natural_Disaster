import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/responsiveness.dart';
import 'package:provider/provider.dart';

import '../provider/character_list_provider.dart';
import '../model/character.dart';
import './image_container.dart';

class PlayerSelection extends StatelessWidget {
  const PlayerSelection({
    Key? key,
    required this.isFemale,
  }) : super(key: key);

  final bool isFemale;

  @override
  Widget build(BuildContext context) {
      final Size size = Responsiveness.screenSize;

    CharacterList characterList = Provider.of<CharacterList>(context);
    List<Character> characters = characterList.charaters
        .where((element) => element.isFemale == isFemale)
        .toList();
    return Material(
      elevation: 5,
      child: Container(
        color: isFemale ? Colors.pink : Colors.blue,
        height: (size.height * 0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: characters.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                if (characters[index].isUnlocked)
                  characterList.toggleSelection(characters[index].id);
              },
              child: ImageContainer(
                character: characters[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
