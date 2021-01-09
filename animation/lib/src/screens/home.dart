import 'dart:math';
import 'package:animation/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> flapAnimation;
  AnimationController flapController;

  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(begin: -40.0, end: -82.0).animate(catController);

    flapController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    flapAnimation =
        Tween(begin: pi * 0.6, end: pi * 0.65).animate(flapController);

    flapAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        flapController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        flapController.forward();
      }
    });
    flapController.forward();
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      flapController.forward();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
      flapController.stop();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlapAnimation(),
              buildRightFlapAnimation(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildLeftFlapAnimation() => Positioned(
        left: 5.0,
        child: AnimatedBuilder(
          animation: flapAnimation,
          child: Container(
            height: 10.0,
            width: 125.0,
            color: Color(0xFF8c7861),
          ),
          builder: (context, child) => Transform.rotate(
            angle: flapAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          ),
        ),
      );

  Widget buildRightFlapAnimation() => Positioned(
        right: 5.0,
        child: AnimatedBuilder(
          animation: flapAnimation,
          child: Container(
            height: 10.0,
            width: 125.0,
            color: Color(0xFF8c7861),
          ),
          builder: (context, child) => Transform.rotate(
            angle: -flapAnimation.value,
            alignment: Alignment.topRight,
            child: child,
          ),
        ),
      );

  Widget buildBox() => Container(
        height: 200.0,
        width: 200.0,
        color: Color(0xFF8c7861),
      );

  // Widget buildRightFlap() => Positioned(
  //       left: 3.0,
  //       child: Transform.rotate(
  //         angle: 45.0,
  //         child: Container(
  //           height: 10.0,
  //           width: 125.0,
  //           color: Color(0xFF8c7861),
  //         ),
  //       ),
  //     );
}
