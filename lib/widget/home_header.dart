import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/responsiveness.dart';
import '../provider/character_list_provider.dart';
import './custom_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

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
                  icon: Icons.music_note,
                  onTap: () {},
                ),
                CustomIconButton(
                  icon: Icons.volume_up,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
