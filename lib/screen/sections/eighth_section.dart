import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EighthSection extends StatefulWidget {
  const EighthSection({super.key});

  @override
  State<EighthSection> createState() => _EighthSectionState();
}

class _EighthSectionState extends State<EighthSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> textRevealEndAnimation;
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

    textRevealEndAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
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
        if ((current.scrollOffsetValue > 3500 &&
                current.scrollOffsetValue < 4400) ||
            controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue >= 3750 &&
            state.scrollOffsetValue <= 4400) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return Stack(
          children: [
            Container(
              height: 400,
            ),
            AnimatedPositioned(
              curve: Curves.easeOutCubic,
              top: state.scrollOffsetValue > 4050 ? 100 : 5,
              left: state.scrollOffsetValue > 4050 ? 200 : 0,
              duration: const Duration(milliseconds: 1300),
              child: AnimatedScale(
                scale: state.scrollOffsetValue > 4000 ? 1 : 0.5,
                duration: const Duration(milliseconds: 1300),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.secondaryColor,
                          blurRadius: 30,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      height: 300,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1400),
              right: state.scrollOffsetValue > 4050
                  ? MediaQuery.of(context).size.width * 0.29
                  : 0,
              top: state.scrollOffsetValue > 4050 ? 120 : 5,
              child: Visibility(
                visible: state.scrollOffsetValue > 4050,
                child: TextReveal(
                  maxHeight: 100,
                  controller: controller,
                  child: const Text(
                    'Amirmahdi Nourkazemi',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 25,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.5,
              top: 160,
              child: AnimatedOpacity(
                curve: Curves.easeInCubic,
                opacity: state.scrollOffsetValue > 4100 ? 1 : 0.1,
                duration: const Duration(milliseconds: 2000),
                child: const Text(
                  'Flutter developer',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CH',
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.50,
              top: 200,
              child: AnimatedOpacity(
                curve: Curves.easeInCubic,
                opacity: state.scrollOffsetValue > 4100 ? 1 : 0.1,
                duration: const Duration(milliseconds: 2000),
                child: const SizedBox(
                  // width: 400,
                  child: Text(
                    'Enthusiastic Flutter developer dedicated to creating top-notch apps and web \nsolutions. Skilled in Flutter web for smooth web application development, \nwith a talent for crafting efficient admin panels. \nRecognized for working collaboratively and solving challenges effectively \nwithin a team environment.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CH',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
