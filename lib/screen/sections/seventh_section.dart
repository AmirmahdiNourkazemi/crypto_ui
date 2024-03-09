import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/screen_offset.dart';

class SeventhSection extends StatefulWidget {
  const SeventhSection({super.key});

  @override
  State<SeventhSection> createState() => _SeventhSectionState();
}

class _SeventhSectionState extends State<SeventhSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
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

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));
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
        if ((current.scrollOffsetValue > 3400 &&
                current.scrollOffsetValue < 4000) ||
            controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue >= 3500 &&
            state.scrollOffsetValue <= 3900) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return AnimatedBuilder(
          animation: textRevealAnimation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextReveal(
                          controller: controller,
                          maxHeight: 80,
                          child: const Text(
                            'Start Your Crypto Odyssey With Us',
                            style: TextStyle(
                              fontFamily: 'CH',
                              color: Color(0xff2A2A2A),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextReveal(
                          maxHeight: 100,
                          controller: controller,
                          child: const Text(
                            'Lorem ipsum dolor sit amet consectetur. Duis morbi scelerisque \nlectus sodales rhoncus.',
                            style: TextStyle(
                              fontFamily: 'CH',
                              color: Color(0xff2A2A2A),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextReveal(
                                maxHeight: 80,
                                controller: controller,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150, 50),
                                    backgroundColor: AppColors.darkColor,
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontFamily: 'CH',
                                      fontSize: 13,
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            TextReveal(
                                maxHeight: 80,
                                controller: controller,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 50),
                                      backgroundColor: AppColors.secondaryColor,
                                      side: const BorderSide(
                                          color: AppColors.darkColor)),
                                  child: const Text(
                                    'Learn more',
                                    style: TextStyle(
                                      fontFamily: 'CH',
                                      fontSize: 13,
                                      color: AppColors.darkColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: transform,
                  builder: (context, child) {
                    return AnimatedPositioned(
                      curve: Curves.easeInCubic,
                      top: (state.scrollOffsetValue > 3600) ? 10 : 300,
                      right: (state.scrollOffsetValue > 3600) ? 250 : 200,
                      duration: const Duration(milliseconds: 1300),
                      child: Image.asset(
                        'assets/images/earth1.png',
                        height: 100,
                      ),
                    );
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
