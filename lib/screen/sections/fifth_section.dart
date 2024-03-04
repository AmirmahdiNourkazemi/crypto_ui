import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/plan_item.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({super.key});

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> planAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;
  late Animation<Offset> transform;

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

    planAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    offsetImage =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    transform =
        Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if ((current.scrollOffsetValue >= 1800 &&
                current.scrollOffsetValue <= 3400) ||
            controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        //print(state.scrollOffsetValue);
        if (state.scrollOffsetValue > 2800.0) {
          //print(state.scrollOffsetValue);
          controller.forward();
        } else {
          controller.reverse();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: AnimatedBuilder(
                animation: textRevealAnimation,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextReveal(
                        maxHeight: 200,
                        controller: controller,
                        child: const Text(
                          'PRICE',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'CH',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      TextReveal(
                        maxHeight: 70,
                        controller: controller,
                        child: const Text(
                          'Flexible Pricing ',
                          style: TextStyle(
                            fontSize: 38,
                            fontFamily: 'CH',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextReveal(
                        maxHeight: 70,
                        controller: controller,
                        child: const Text(
                          'for Every Project',
                          style: TextStyle(
                            fontSize: 38,
                            fontFamily: 'CH',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  planCard(planAnimation, Colors.white, AppColors.scaffoldColor,
                      AppColors.secondaryColor, 'Basic Edition', '\$600 / prj'),
                  const SizedBox(
                    width: 20,
                  ),
                  planCard(
                      planAnimation,
                      Colors.black,
                      AppColors.secondaryColor,
                      AppColors.scaffoldColor,
                      'Enterprise Edition',
                      '\$1000 / prj'),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
