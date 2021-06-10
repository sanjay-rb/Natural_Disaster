import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/responsiveness.dart';
import 'package:natural_disaster/widget/custom_text_btn.dart';
import 'package:natural_disaster/widget/stage_items.dart';

class StageScreen extends StatelessWidget {
  static const routeName = '/stage';
  const StageScreen({Key? key}) : super(key: key);
  static const stageList = [
    'Tsunami',
    'Earthquake',
    'Tornado',
    'Flood',
    'Forest Fire',
    'Volcano',
    'Corona',
    'Comming soon....'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Responsiveness.width(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsiveness.height(10),
              ),
              child: Text(
                "Stages",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stageList.length,
                itemBuilder: (_, index) => StageItems(
                  stage: stageList[index],
                ),
              ),
            ),
            Row(
              children: [
                CustomTextButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  text: "Back",
                  icon: Icons.navigate_before,
                  isIconFirst: true,
                ),
                Spacer(),
                CustomTextButton(
                  onTap: () {
                    // TODO : Start game....
                  },
                  text: "Start",
                  icon: Icons.navigate_next,
                  isIconFirst: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
