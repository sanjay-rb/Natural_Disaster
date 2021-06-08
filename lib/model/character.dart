import 'package:flutter/material.dart';

class Character {
  int id;
  String name;
  String gifPath;
  bool isFemale;
  MaterialColor color;
  bool isSelected = false;
  bool isUnlocked = false;

  Character({
    required this.id,
    required this.name,
    required this.gifPath,
    required this.isFemale,
    required this.color,
    required this.isSelected,
    required this.isUnlocked,
  });
}
