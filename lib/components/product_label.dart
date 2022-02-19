// A product can be pay as you sell or pay as you go

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';

enum LabelType { pod, pays }

class ProductLabel extends StatelessWidget {
  final LabelType labelType;
  const ProductLabel({
    Key? key,
    required this.labelType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<LabelType, Map<String, dynamic>> labelProps = {
      LabelType.pod: {
        "color": const Color(0XFFE5F6FF),
        "outerBorder": const Color(0XFF9CDBFD),
        "textColor": const Color(0XFF3D4FAE),
        "label": "Pay As You Go",
        "iconPath": "PODLabel",
      },
      LabelType.pays: {
        "color": const Color(0XFFFCF5FF),
        "outerBorder": const Color(0XFFDCBFFF),
        "textColor": const Color(0XFF471B6A),
        "label": "Pay As You Sell",
        "iconPath": "PAYSLabel",
      }
    };

    return Container(
      decoration: BoxDecoration(
        color: labelProps[labelType]!["color"],
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: labelProps[labelType]!["outerBorder"]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svgIcons[labelProps[labelType]!["iconPath"]]!,
              width: labelType == LabelType.pays ? 20 : null,
            ),
            Text(
              "  ${labelProps[labelType]!["label"]}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: labelProps[labelType]!["textColor"],
              ),
            )
          ],
        ),
      ),
    );
  }
}
