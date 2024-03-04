import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/material.dart';

Widget planCard(Animation<double> planAnimation, Color textColor,
    Color containerColor, Color borderColor, String text, String price) {
  return ScaleTransition(
    scale: planAnimation,
    child: Container(
      height: 480,
      width: 300,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: borderColor),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'CH',
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            price,
            style: TextStyle(
              fontFamily: 'CH',
              color: textColor,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 240,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Eu eget ornare.',
              style: TextStyle(
                fontFamily: 'CH',
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: borderColor,
                  size: 20,
                ),
                label: Text(
                  'Lorem ipsum dolor',
                  style: TextStyle(
                    fontFamily: 'CH',
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: borderColor,
                  size: 20,
                ),
                label: Text(
                  'Lorem ipsum dolor',
                  style: TextStyle(
                    fontFamily: 'CH',
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: borderColor,
                  size: 20,
                ),
                label: Text(
                  'Lorem ipsum dolor',
                  style: TextStyle(
                    fontFamily: 'CH',
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: borderColor),
                  fixedSize: const Size(200, 54),
                  backgroundColor: AppColors.scaffoldColor,
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
              ),
            ],
          )
        ],
      ),
    ),
  );
}
