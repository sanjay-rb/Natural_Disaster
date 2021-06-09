import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameAudio {
  static tapSound() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("isSoundOff") == false)
      FlameAudio.audioCache.play('click.mp3');
  }
}
