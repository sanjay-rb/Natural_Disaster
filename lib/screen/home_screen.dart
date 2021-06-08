import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/player_selection_icons.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Consumer<CharacterList>(builder: (_, charaterList, w) {
                      var charater = charaterList.charaters
                          .where((element) => element.isSelected == true)
                          .toList()[0];
                      return Container(
                        width: 64,
                        height: 64,
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
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Expanded(
                child: Container(
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
                        size: size,
                        isFemale: isFemale,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
