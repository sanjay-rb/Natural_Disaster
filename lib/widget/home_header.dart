import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/responsiveness.dart';
import '../provider/character_list_provider.dart';
import './custom_icon.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late bool isBGMOff = false;
  late bool isSoundOff = false;
  late SharedPreferences pref;
  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      isBGMOff = pref.getBool("isBGMOff")!;
      isSoundOff = pref.getBool("isSoundOff")!;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Consumer<CharacterList>(builder: (_, charaterList, w) {
            var charater = charaterList.charaters
                .where((element) => element.isSelected == true)
                .toList()[0];
            return Container(
              width: Responsiveness.width(70),
              height: Responsiveness.height(70),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.height * 0.005,
                ),
                gradient: RadialGradient(
                  colors: [
                    charater.color.shade50,
                    charater.color.shade300,
                  ],
                ),
              ),
              child: Image.asset(
                charater.gifPath,
                fit: BoxFit.fill,
              ),
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Runs : 1500 km",
                  ),
                  Text(
                    "Coins : 10000",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                CustomIconButton(
                  icon: isBGMOff ? Icons.music_off : Icons.music_note,
                  color: isBGMOff ? Colors.grey : Colors.green,
                  onTap: () async {
                    setState(() {
                      isBGMOff = !isBGMOff;
                    });
                    pref.setBool("isBGMOff", isBGMOff);
                    if (isBGMOff) {
                      FlameAudio.bgm.pause();
                    } else {
                      FlameAudio.bgm.resume();
                    }
                  },
                ),
                CustomIconButton(
                  icon: isSoundOff ? Icons.volume_off : Icons.volume_up,
                  color: isSoundOff ? Colors.grey : Colors.green,
                  onTap: () async {
                    setState(() {
                      isSoundOff = !isSoundOff;
                    });
                    pref.setBool('isSoundOff', isSoundOff);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
