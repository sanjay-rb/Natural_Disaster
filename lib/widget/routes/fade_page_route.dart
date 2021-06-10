import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget enterPage;
  FadePageRoute({
    required this.enterPage,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: new Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            child: enterPage,
          ),
        );
}
