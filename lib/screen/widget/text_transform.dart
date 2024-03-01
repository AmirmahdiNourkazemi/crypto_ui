import 'package:flutter/material.dart';

class TextTransform extends StatefulWidget {
  final double maxHeight;
  final Widget child;
  final AnimationController controller;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;

  const TextTransform({
    Key? key,
    required this.maxHeight,
    required this.child,
    required this.controller,
    this.textRevealAnimation,
    this.textOpacityAnimation,
  }) : super(key: key);

  @override
  State<TextTransform> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextTransform>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;

  @override
  void initState() {
    controller = widget.controller;

    textRevealAnimation = widget.textRevealAnimation ??
        Tween<double>(begin: -100.0, end: 0.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.bounceOut),
        );

    textOpacityAnimation = widget.textOpacityAnimation ??
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOut),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textRevealAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(textRevealAnimation.value, 0.0),
          child: LimitedBox(
            maxHeight: widget.maxHeight,
            child: Container(
              child: FadeTransition(
                opacity: textOpacityAnimation,
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}
