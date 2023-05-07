import 'package:flutter/material.dart';

class AnimationTextSplash extends StatelessWidget {
  const AnimationTextSplash({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Explore The World',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
