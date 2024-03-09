import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/model/news.dart';
import 'package:crypto_ui_web/screen/widget/news_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/color.dart';

class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection>
    with TickerProviderStateMixin {
  @override
  late AnimationController controller;
  @override
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

  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 2800 &&
                    current.scrollOffsetValue <= 3600) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue > 3400.0) {
              //print(state.scrollOffsetValue);
              controller.forward();
            } else {
              controller.reverse();
            }
            return Column(
              children: [
                TextReveal(
                  maxHeight: 70,
                  controller: controller,
                  child: const Text(
                    'NEWS',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
                TextReveal(
                  maxHeight: 70,
                  controller: controller,
                  child: const Text(
                    'Dive into Our Dynamic News Feed',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: news
                          .map((news) => NewsCard(
                                news,
                              ))
                          .toList()),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
