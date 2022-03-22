// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TODO: check logic here it looks stupid
class CustomButton extends StatelessWidget {
  final String title;
  final String? iconPath;
  final bool hasIcon;
  final double? verticalPad;
  final double? horizontalPad;
  final double? textSize;
  final bool? rightSide;
  final bool? active; // is button active
  final void Function()? function;
  const CustomButton({
    Key? key,
    required this.title,
    this.iconPath = "assets/icons/arrow.svg",
    this.hasIcon = false,
    this.rightSide = false,
    this.verticalPad = 10,
    this.horizontalPad = 15,
    this.textSize = 16,
    this.active = true,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          primary: const Color(0XFF4D2999),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          shadowColor: const Color(0XFF9BA1B5),
          padding: EdgeInsets.symmetric(
            vertical: verticalPad!,
            horizontal: horizontalPad!,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rightSide!
                ? const SizedBox()
                : hasIcon
                    ? SvgPicture.asset(
                        iconPath!,
                        color: Colors.white,
                        width: 15,
                      )
                    : const SizedBox(),
            rightSide!
                ? const SizedBox()
                : hasIcon
                    ? const SizedBox(
                        width: 6,
                      )
                    : const SizedBox(),
            Text(
              title,
              style: TextStyle(
                color: active! ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: textSize!,
              ),
            ),
            rightSide!
                ? SvgPicture.asset(
                    iconPath!,
                    color: active! ? Colors.white : Colors.black,
                    width: 15,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
