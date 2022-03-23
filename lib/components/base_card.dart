import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/redirect_link.dart';

class BaseCard extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String infoText;
  final TextStyle infoStyle;
  final String linkText;
  final String iconPath;
  final Color iconColor;
  final double iconWidth;
  final double height;
  final void Function()? function;
  final bool? showIcon;
  const BaseCard({
    Key? key,
    required this.title,
    this.titleStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
      // fontWeight: FontWeight.bold,
    ),
    required this.infoText,
    this.infoStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    required this.linkText,
    required this.iconPath,
    this.function,
    this.iconColor = Colors.grey,
    this.iconWidth = 16,
    this.height = 140,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            showIcon!
                ? Positioned(
                    top: -100,
                    right: -200,
                    bottom: -100,
                    //width: 30,
                    child: Image.asset(
                      "assets/images/SL-X-teal-light.png",
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: iconWidth,
                        color: iconColor,
                      ),
                      Text(
                        " $title",
                        style: titleStyle,
                      ),
                    ],
                  ),
                  Text(
                    infoText,
                    style: infoStyle,
                  ),
                  RedirectLink(
                    title: linkText,
                    function: function,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
