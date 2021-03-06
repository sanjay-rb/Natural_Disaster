import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/responsiveness.dart';
import '../constants/game_images.dart';
import './home_screen.dart';

class SpalshScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  double _progress = 0.0;
  final totalSounds = 2;
  final totalBoys = 8;
  final totalGirls = 8;
  final totalPlatforms = 4;
  final totalDisasters = 1;
  final totalInterrupts = 1;
  var totalAsset;
  @override
  void initState() {
    init();
    totalAsset = totalSounds +
        totalBoys +
        totalGirls +
        totalPlatforms +
        totalDisasters +
        totalInterrupts;
    super.initState();
  }

  void init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.bgm.loadAll(['bgm.mp3']);
    await FlameAudio.audioCache.loadAll(['click.mp3']);
    setState(() {
      _progress += (totalSounds / totalAsset);
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('isBGMOff') == null) {
      await pref.setBool('isBGMOff', false);
    }
    await FlameAudio.bgm.play('bgm.mp3');
    if (pref.getBool('isBGMOff') == true) {
      FlameAudio.bgm.pause();
    }
    if (pref.getBool('isSoundOff') == null) {
      await pref.setBool('isSoundOff', false);
    }
    GameImages.boys = await Flame.images.loadAll(
      List.generate(totalBoys, (index) => "boys/boy$index.png"),
    );

    setState(() {
      _progress += (totalBoys / totalAsset);
    });
    GameImages.girls = await Flame.images.loadAll(
      List.generate(totalGirls, (index) => "girls/girl$index.png"),
    );

    setState(() {
      _progress += (totalGirls / totalAsset);
    });
    GameImages.platforms = await Flame.images.loadAll(
      List.generate(totalPlatforms, (index) => "platforms/platform$index.png"),
    );

    setState(() {
      _progress += (totalPlatforms / totalAsset);
    });
    GameImages.disasters = await Flame.images.loadAll(
      List.generate(totalDisasters, (index) => "disasters/disaster$index.png"),
    );

    setState(() {
      _progress += (totalDisasters / totalAsset);
    });
    GameImages.interrupts = await Flame.images.loadAll(
      List.generate(
          totalInterrupts, (index) => "interrupts/interrupt$index.png"),
    );

    setState(() {
      _progress += (totalInterrupts / totalAsset);
    });
    Responsiveness.screenSize = MediaQuery.of(context).size;
    Navigator.of(context)
        .pushReplacementNamed(HomeScreen.routeName, arguments: widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Natural Disaster",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: LinearProgressIndicator(
                value: _progress,
              ),
            )
          ],
        ),
      ),
    );
  }
}
