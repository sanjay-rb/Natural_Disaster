import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/responsiveness.dart';
import 'package:natural_disaster/widget/custom_text_btn.dart';

class StageScreen extends StatelessWidget {
  static const routeName = '/stage';
  const StageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Responsiveness.width(10)),
        child: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomTextButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: "Back",
                icon: Icons.navigate_before,
                isIconFirst: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
