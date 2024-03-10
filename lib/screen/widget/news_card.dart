// import 'package:crypto_ui_web/bloc/screen_offset.dart';
// import 'package:crypto_ui_web/constant/color.dart';
// import 'package:crypto_ui_web/model/news.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewsCard extends StatefulWidget {
//   final News news;
//   const NewsCard(this.news, {super.key});

//   @override
//   State<NewsCard> createState() => _NewsCardState();
// }

// class _NewsCardState extends State<NewsCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1000));

//     animation = Tween(begin: 250.0, end: 0.0).animate(CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.0, 1.0, curve: Curves.easeOut)));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DisplayOffset, ScrollOffset>(
//       buildWhen: (previous, current) {
//         if (current.scrollOffsetValue > 3400) {
//           return true;
//         } else {
//           return false;
//         }
//       },
//       builder: (context, state) {
//         if (state.scrollOffsetValue > 3600) {
//           controller.forward();
//         } else {
//           controller.reverse();
//         }
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: AnimatedBuilder(
//             animation: animation,
//             builder: (context, child) {
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color(0xff2A2A2A),
//                   border: Border.all(
//                     width: 1,
//                     color: AppColors.secondaryColor,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                           child: Image.asset(
//                             widget.news.image,
//                             fit: BoxFit.contain,
//                             height: 218,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Text(
//                             widget.news.title,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'CH',
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: SizedBox(
//                             width: 260,
//                             child: Text(
//                               widget.news.description,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'CH',
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Nov. 28, 2023',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'CH',
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.1,
//                               ),
//                               const Text(
//                                 'See more',
//                                 style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: 'CH',
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Align(
//                       alignment: Alignment(
//                           (widget.news.index % 2 == 1) ? 1.0 : -1.0, 1.0),
//                       child: Container(
//                         height: 400.0,
//                         width: animation.value,
//                         color: const Color(0xff2A2A2A),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCard extends StatefulWidget {
  final News news;
  const NewsCard(this.news, {super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween(begin: 250.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut)));
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
        if (current.scrollOffsetValue >= 4200) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue >= 4300) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedCrossFade(
            crossFadeState: state.scrollOffsetValue >= 3900
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 1000),
            alignment: Alignment.center,
            reverseDuration: const Duration(milliseconds: 1000),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.linear,
            firstChild: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff2A2A2A),
              ),
            ),
            secondChild: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff2A2A2A),
                border: Border.all(
                  width: 1,
                  color: AppColors.secondaryColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      widget.news.image,
                      fit: BoxFit.contain,
                      height: 218,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.news.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'CH',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        widget.news.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'CH',
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nov. 28, 2023',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CH',
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        const Text(
                          'See more',
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontFamily: 'CH',
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
