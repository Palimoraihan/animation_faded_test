import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  const CustomAnimation({super.key, required this.delay, required this.child});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationOpacity;
  late Animation<double> animationRotationY;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      duration: Duration(milliseconds:  (500 * widget.delay).round()),
      vsync: this,
    );
    animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationRotationY =
        Tween<double>(begin: -30.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return  Opacity(
            opacity: animationOpacity.value,
            child: Transform.translate(
                offset: Offset(0, animationRotationY.value), child: widget.child),
          );
        });
  }
}
