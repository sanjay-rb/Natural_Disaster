import 'package:flutter/material.dart';

import '../model/character.dart';

class CharacterList extends ChangeNotifier {
  List<Character> _charaterList = [
    Character(
      id: 0,
      name: "Cool Boy",
      gifPath: 'assets/images/gifs/boy0.gif',
      isFemale: false,
      color: Colors.grey,
      isSelected: true,
      isUnlocked: true,
    ),
    Character(
      id: 1,
      name: "Surfer",
      gifPath: 'assets/images/gifs/boy1.gif',
      isFemale: false,
      color: Colors.blue,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 2,
      name: "Traveler",
      gifPath: 'assets/images/gifs/boy2.gif',
      isFemale: false,
      color: Colors.brown,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 3,
      name: "Hunter",
      gifPath: 'assets/images/gifs/boy3.gif',
      isFemale: false,
      color: Colors.green,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 4,
      name: "Killer",
      gifPath: 'assets/images/gifs/boy4.gif',
      isFemale: false,
      color: Colors.red,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 5,
      name: "CID",
      gifPath: 'assets/images/gifs/boy5.gif',
      isFemale: false,
      color: Colors.deepPurple,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 6,
      name: "Rowdy Rangan",
      gifPath: 'assets/images/gifs/boy6.gif',
      isFemale: false,
      color: Colors.lime,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 7,
      name: "Toon Boy",
      gifPath: 'assets/images/gifs/boy7.gif',
      isFemale: false,
      color: Colors.orange,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 8,
      name: "Cool Girl",
      gifPath: 'assets/images/gifs/girl0.gif',
      isFemale: true,
      color: Colors.brown,
      isSelected: false,
      isUnlocked: true,
    ),
    Character(
      id: 9,
      name: "Beach Beauty",
      gifPath: 'assets/images/gifs/girl1.gif',
      isFemale: true,
      color: Colors.blue,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 10,
      name: "House Rider",
      gifPath: 'assets/images/gifs/girl2.gif',
      isFemale: true,
      color: Colors.grey,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 11,
      name: "She Hunder",
      gifPath: 'assets/images/gifs/girl3.gif',
      isFemale: true,
      color: Colors.green,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 12,
      name: "CID Girl",
      gifPath: 'assets/images/gifs/girl4.gif',
      isFemale: true,
      color: Colors.deepPurple,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 13,
      name: "Deathly Beauty",
      gifPath: 'assets/images/gifs/girl5.gif',
      isFemale: true,
      color: Colors.red,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 14,
      name: "Queen",
      gifPath: 'assets/images/gifs/girl6.gif',
      isFemale: true,
      color: Colors.pink,
      isSelected: false,
      isUnlocked: false,
    ),
    Character(
      id: 15,
      name: "Leader",
      gifPath: 'assets/images/gifs/girl7.gif',
      isFemale: true,
      color: Colors.orange,
      isSelected: false,
      isUnlocked: false,
    ),
  ];
  get charaters => [..._charaterList];

  toggleSelection(id) {
    this._charaterList.forEach((element) {
      if (element.id == id)
        element.isSelected = true;
      else
        element.isSelected = false;
    });
    notifyListeners();
  }
}
