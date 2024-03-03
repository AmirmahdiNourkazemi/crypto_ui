import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageReveal extends StatefulWidget {
  final String image;
  const ImageReveal(this.image, {super.key});

  @override
  State<ImageReveal> createState() => _ImageRevealState();
}

class _ImageRevealState extends State<ImageReveal>
    with TickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController controller;

  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 500));

    imageReveal = Tween<double>(begin: 00.0, end: 170.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.50, curve: Curves.easeInOutCubic)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));

    priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 375),
        child: BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            //print(current.scrollOffsetValue);
            if ((current.scrollOffsetValue >= 800 &&
                    current.scrollOffsetValue <= 1200) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue >= (940)) {
              controller.forward();
            } else {
              // print('inside reverse');

              controller.reverse();
            }
            return AnimatedBuilder(
              animation: imageOpacity,
              builder: (context, child) {
                return ScaleTransition(
                  scale: imageOpacity,
                  child: Image.asset(
                    widget.image,
                    width: 200,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
