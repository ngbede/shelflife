import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';

class PAYSIcon extends StatelessWidget {
  const PAYSIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFFF4EBFF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(
          svgIcons["PAYS"]!,
          width: 15,
        ),
      ),
    );
  }
}
