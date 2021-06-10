import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/splash_screen.dart';
import './screen/home_screen.dart';
import './screen/stage_screen.dart';
import './provider/character_list_provider.dart';
import './provider/highscore_provider.dart';
import './widget/routes/left_right_route.dart';
import './widget/routes/fade_page_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortraitUpOnly();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterList>(create: (_) => CharacterList()),
        ChangeNotifierProvider<HighScore>(
          create: (_) => HighScore(),
        ),
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
          headline1: TextStyle(
            fontFamily: "OdibeeSans",
            fontSize: 30,
            color: Colors.black,
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
