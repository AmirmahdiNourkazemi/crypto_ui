import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  const ItemCard(
      {required this.image,
      required this.subtitle,
      required this.title,
      super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController controller;

  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
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

    // priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //     parent: controller,
    //     curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));
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
    return Container(
      height: 345,
      width: 400,
      child: BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
          if ((current.scrollOffsetValue >= 2000 &&
                  current.scrollOffsetValue <= 2950) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          if (state.scrollOffsetValue >= (2400)) {
            controller.forward();
          } else {
            controller.reverse();
          }
          return AnimatedBuilder(
              animation: imageOpacity,
              builder: (context, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 230.0,
                      width: 230.0,
                      child: Center(
                        child: FadeTransition(
                          opacity: imageOpacity,
                          child: SizedBox(
                            height: imageReveal.value,
                            width: imageReveal.value,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.medium,
                                scale: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Column(
                      children: [
                        FadeTransition(
                          opacity: headingTextOpacity,
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'CH',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeTransition(
                          opacity: descriptionOpacity,
                          child: Text(
                            widget.subtitle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'CH',
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                );
              });
        },
      ),
    );
  }
}
