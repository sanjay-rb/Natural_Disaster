import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:natural_disaster/constants/responsiveness.dart';
import 'package:natural_disaster/widget/home_header.dart';
import 'package:provider/provider.dart';
import '../widget/player_selection_icons.dart';
import '../widget/custom_icon.dart';
import '../provider/character_list_provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = "/home";
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
        child: Padding(
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
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: Responsiveness.width(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      )
                    ],
                    gradient: RadialGradient(
                      colors: [
                        Colors.green.shade50,
                        Colors.green.shade300,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Next"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
