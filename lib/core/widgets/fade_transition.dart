import 'package:flutter/material.dart';

class CustomFadeTransition extends StatefulWidget {
  final Widget child;
  final int durationInMilliSeconds;
  final Function()? onDone;

  const CustomFadeTransition(
      {super.key,
      this.durationInMilliSeconds = 2000,
      required this.child,
      this.onDone});

  @override
  State<CustomFadeTransition> createState() => _CustomFadeTransitionState();
}

class _CustomFadeTransitionState extends State<CustomFadeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliSeconds),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward().whenComplete(widget.onDone ?? () => null);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
