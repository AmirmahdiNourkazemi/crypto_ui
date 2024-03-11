import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/material.dart';

class NinthSection extends StatefulWidget {
  const NinthSection({super.key});

  @override
  State<NinthSection> createState() => _NinthSectionState();
}

class _NinthSectionState extends State<NinthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Frame 19.png',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet consectetur. \nFusce nisl lacus elementum neque.',
                      style: TextStyle(
                        fontFamily: 'CH',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontFamily: 'CH',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '(524) 333 6565',
                          style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'example@email.com',
                          style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
