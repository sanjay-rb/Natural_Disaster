import 'package:flutter/foundation.dart';

class HighScore with ChangeNotifier {
  int _totalRun = 0;
  int _totalCoins = 0;

  int get totalRun => this._totalRun;
  int get totalCoins => this._totalCoins;
  set totalRun(value) {
    this._totalRun = value;
    notifyListeners();
  }

  set totalCoins(value) {
    this._totalCoins = value;
    notifyListeners();
  }
}
