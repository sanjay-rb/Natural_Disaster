import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/game_audios.dart';
import 'package:natural_disaster/constants/responsiveness.dart';

class StageItems extends StatelessWidget {
  final stage;
  const StageItems({Key? key, this.stage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GameAudio.tapSound();
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Responsiveness.height(10.0)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              width: Responsiveness.screenSize.width,
              height: Responsiveness.height(100),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Responsiveness.height(10.0)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10),
              ),
              width: Responsiveness.screenSize.width,
              height: Responsiveness.height(90),
              child: Center(
                child: Text(stage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
