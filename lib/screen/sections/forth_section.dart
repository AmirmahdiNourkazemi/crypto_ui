import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/model/items.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForthSection extends StatefulWidget {
  const ForthSection({super.key});

  @override
  State<ForthSection> createState() => _ForthSectionState();
}

class _ForthSectionState extends State<ForthSection>
    with TickerProviderStateMixin {
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

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 1500 &&
                    current.scrollOffsetValue <= 2600) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue > 2200.0) {
              print(state.scrollOffsetValue);
              controller.forward();
            } else {
              controller.reverse();
            }
            return Column(
              children: [
                TextReveal(
                  controller: controller,
                  maxHeight: 70.0,
                  child: const Text(
                    'SERVICES',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
                TextReveal(
                  controller: controller,
                  maxHeight: 70.0,
                  child: const Text(
                    'Innovate with Blockchain Technology',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: items
                      .map(
                        (item) => ItemCard(
                          image: item.image,
                          title: item.title,
                          subtitle: item.subtitle,
                        ),
                      )
                      .toList(),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
