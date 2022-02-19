import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';

class RedirectLink extends StatelessWidget {
  final String title;
  final bool boldTitle;
  final bool includeArrow;
  final bool underlineText;
  final double titleSize;
  final Color textColor;
  final void Function()? function;
  const RedirectLink({
    Key? key,
    required this.title,
    this.boldTitle = true,
    this.includeArrow = true,
    this.underlineText = true,
    this.titleSize = 15,
    this.textColor = const Color(0XFF4D2999),
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              decoration: underlineText ? TextDecoration.underline : null,
              color: textColor,
              fontWeight: boldTitle ? FontWeight.bold : null,
              fontSize: titleSize,
            ),
          ),
          const SizedBox(width: 3),
          includeArrow
              ? SvgPicture.asset(
                  svgIcons["arrow"]!,
                  color: textColor,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
