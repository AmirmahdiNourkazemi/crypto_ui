import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/material.dart';

class SeventhSection extends StatefulWidget {
  const SeventhSection({super.key});

  @override
  State<SeventhSection> createState() => _SeventhSectionState();
}

class _SeventhSectionState extends State<SeventhSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
      ),
      child: Center(
        child: Text(
          'Start Your Crypto Odyssey With Us',
          style: TextStyle(
              fontFamily: 'CH',
              color: Color(0xff2A2A2A),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
