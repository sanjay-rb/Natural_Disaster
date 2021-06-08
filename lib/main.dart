import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
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
      routes: {
        SpalshScreen.routeName: (_) => const SpalshScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
