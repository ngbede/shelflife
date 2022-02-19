import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TODO: check logic here it looks stupid
// TODO: Refactor this button to dynamically align to the size needed per screen
class CustomButton extends StatelessWidget {
  final String title;
  final String? iconPath;
  final bool hasIcon;
  final bool? rightSide;
  final void Function()? function;
  const CustomButton({
    Key? key,
    required this.title,
    this.iconPath = "assets/icons/arrow.svg",
    this.hasIcon = false,
    this.rightSide = false,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 6,
        shadowColor: const Color(0XFF9BA1B5),
        color: const Color(0XFF4D2999),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              rightSide!
                  ? SvgPicture.asset(
                      iconPath!,
                      color: Colors.white,
                      width: 15,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
