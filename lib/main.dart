import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:natural_disaster/screen/stage_screen.dart';
import 'package:natural_disaster/widget/fade_page_route.dart';
import 'package:natural_disaster/widget/left_right_route.dart';
import 'package:provider/provider.dart';

import './screen/splash_screen.dart';
import './screen/home_screen.dart';
import './provider/character_list_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortraitUpOnly();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterList>(create: (_) => CharacterList()),
      ],
      builder: (ctx, w) => NaturalDisasterApp(),
    ),
  );
}

class NaturalDisasterApp extends StatelessWidget {
  const NaturalDisasterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Natural Disaster',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: "OdibeeSans",
            fontSize: 15,
          ),
          bodyText2: TextStyle(
            fontFamily: "OdibeeSans",
            fontSize: 20,
          ),
          caption: TextStyle(
            fontFamily: "OdibeeSans",
            fontSize: 25,
          ),
        ),
      ),
      initialRoute: SpalshScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {
        print(settings.toString());
        switch (settings.name) {
          case SpalshScreen.routeName:
            return MaterialPageRoute(builder: (_) => SpalshScreen());
          case HomeScreen.routeName:
            return FadePageRoute(
              enterPage: HomeScreen(),
            );
          case StageScreen.routeName:
            return LeftRightRoute(
              exitPage: settings.arguments as HomeScreen,
              enterPage: StageScreen(),
            );
        }
      },
    );
  }
}
