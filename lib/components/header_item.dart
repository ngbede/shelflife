import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderItem extends StatelessWidget {
  final String iconPath;
  final String title;
  const HeaderItem({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: title == "Products" ? 15 : 18,
          color: const Color(0XFF666666),
        ),
        Text(
          "  $title",
          style: const TextStyle(
            color: Color(0XFF666666),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
