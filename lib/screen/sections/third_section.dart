import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));
    offsetImage =
        Tween<Offset>(begin: const Offset(-10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if (current.scrollOffsetValue > 1000 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 1000) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return Row(
          children: [
            Expanded(
                child: AnimatedBuilder(
              animation: offsetImage,
              builder: (context, child) {
                if (state.scrollOffsetValue > 800.0 &&
                    state.scrollOffsetValue > 1200.0) {
                  // print('inside forward:${state.scrollOffsetValue}');
                  controller.forward();
                } else {
                  // print('inside reverse:${state.scrollOffsetValue}');
                  controller.reverse();
                }
                return SlideTransition(
                    position: offsetImage,
                    child: Image.asset('assets/images/Frame 29.png'));
              },
            )),
            Expanded(
                child: Column(
              children: [],
            )),
          ],
        );
      },
    );
  }
}
