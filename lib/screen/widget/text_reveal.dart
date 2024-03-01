import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TextReveal extends StatefulWidget {
  final double maxHeight;
  final Widget child;
  final AnimationController controller;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;
  const TextReveal(
      {Key? key,
      required this.maxHeight,
      required this.child,
      required this.controller,
      this.textRevealAnimation,
      this.textOpacityAnimation})
      : super(key: key);

  @override
  State<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextReveal> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;

  @override
  void initState() {
    controller = widget.controller;

    textRevealAnimation = widget.textRevealAnimation ??
        Tween<double>(begin: 100.0, end: 0.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOut));

    textOpacityAnimation = widget.textOpacityAnimation ??
        Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: textRevealAnimation,
        builder: (context, child) {
          return LimitedBox(
            maxHeight: widget.maxHeight,
            child: Container(
              padding: EdgeInsets.only(top: textRevealAnimation.value),
              child: FadeTransition(
                opacity: textOpacityAnimation,
                child: widget.child,
              ),
            ),
          );
        });
  }
}
