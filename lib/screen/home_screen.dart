import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/game_audios.dart';
import 'package:natural_disaster/constants/responsiveness.dart';
import 'package:natural_disaster/screen/stage_screen.dart';
import 'package:natural_disaster/widget/custom_text_btn.dart';
import 'package:natural_disaster/widget/home_header.dart';
import '../widget/player_selection_icons.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Responsiveness.width(10)),
          child: Column(
            children: [
              HomeHeader(),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: Responsiveness.heightRatio(0.5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFemale = false;
                                });
                                GameAudio.tapSound();
                              },
                              child: Container(
                                color: isFemale
                                    ? Colors.blue.shade900
                                    : Colors.blue,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Male",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: isFemale
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFemale = true;
                                });
                                GameAudio.tapSound();
                              },
                              child: Container(
                                color: isFemale
                                    ? Colors.pink
                                    : Colors.pink.shade900,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Female",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: isFemale
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      PlayerSelection(
                        isFemale: isFemale,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  CustomTextButton(
                    onTap: () {
                      // TODO : Create Credits Page.....
                    },
                    text: "Credits",
                    icon: Icons.face,
                    isIconFirst: true,
                  ),
                  Spacer(),
                  CustomTextButton(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(StageScreen.routeName, arguments: widget);
                    },
                    text: "Next",
                    icon: Icons.navigate_next,
                    isIconFirst: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
