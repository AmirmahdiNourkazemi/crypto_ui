import 'package:crypto_ui_web/screen/sections/eighth_section.dart';
import 'package:crypto_ui_web/screen/sections/fifth_section.dart';
import 'package:crypto_ui_web/screen/sections/forth_section.dart';
import 'package:crypto_ui_web/screen/sections/second_section.dart';
import 'package:crypto_ui_web/screen/sections/seventh_section.dart';
import 'package:crypto_ui_web/screen/sections/third_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/screen_offset.dart';
import 'sections/first_sections.dart';
import 'sections/sixth_section.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: const [
        FirstSection(),
        SecondScreen(),
        ThirdSection(),
        SizedBox(
          height: 100.0,
        ),
        ForthSection(),
        SizedBox(
          height: 50.0,
        ),
        FifthSection(),
        SizedBox(
          height: 50.0,
        ),
        SeventhSection(),
        SizedBox(
          height: 100.0,
        ),
        EighthSection(),
        SizedBox(
          height: 100.0,
        ),
        SixthSection(),
        SizedBox(
          height: 200.0,
        ),
      ],
    );
  }
}
