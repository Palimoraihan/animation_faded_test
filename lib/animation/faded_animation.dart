import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimationWidget extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimationWidget(this.delay, this.child);


  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(duration: const Duration(milliseconds: 500))
      .tween('opacity', Tween<double>(begin: 0.0, end: 1.0))
      .tween('translateY', Tween<double>(begin: -30.0, end: 0.0));
    return PlayAnimationBuilder<Movie>(
        delay: Duration(milliseconds: (500 * delay).round()),
        tween: tween,
        duration: tween.duration,
        builder: (context, value, child) => Opacity(
              opacity: value.get('opacity'),
              child: Transform.translate(
                  offset: Offset(0, value.get('translateY')), child: child),
            ));
    // final tween = MultiTrackTween([
    //   Track("opacity")
    //       .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: Transform.translate(
    //         offset: Offset(0, animation["translateY"]), child: child),
    //   ),
    // );
  }
}
