import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/image_reveal.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldColor,
      // decoration: BoxDecoration(),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            shape: BoxShape.rectangle,
            color: AppColors.secondaryColor,
          ),
          child: BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
              if ((current.scrollOffsetValue >= 800 &&
                      current.scrollOffsetValue <= 1200) ||
                  controller.isAnimating) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              //  print('all:${state.scrollOffsetValue}');
              if (state.scrollOffsetValue > 800.0 &&
                  state.scrollOffsetValue > 1200.0) {
                // print('inside forward:${state.scrollOffsetValue}');
                controller.forward();
              } else {
                // print('inside reverse:${state.scrollOffsetValue}');
                controller.reverse();
              }
              return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageReveal('assets/images/Logo1.png'),
                  ImageReveal('assets/images/Logo2.png'),
                  ImageReveal('assets/images/Logo3.png'),
                  ImageReveal('assets/images/Logo4.png'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
