import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../constants/game_images.dart';
import './home_screen.dart';

class SpalshScreen extends StatefulWidget {
  static final routeName = '/stash';
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  double _progress = 0.0;
  final totalBoys = 8;
  final totalGirls = 8;
  final totalPlatforms = 4;
  final totalDisasters = 1;
  final totalInterrupts = 1;
  var totalAsset;
  @override
  void initState() {
    init();
    totalAsset = totalBoys +
        totalGirls +
        totalPlatforms +
        totalDisasters +
        totalInterrupts;
    super.initState();
  }

  void init() async {
    FlameAudio.bgm.load('bgm.mp3');
    FlameAudio.bgm.play('bgm.mp3');
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
    if (_progress == 1.0) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
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
