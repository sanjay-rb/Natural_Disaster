import 'package:flutter/material.dart';

class LeftRightRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  LeftRightRoute({required this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionDuration: Duration(milliseconds: 400),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
