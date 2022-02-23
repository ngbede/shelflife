import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';

class MenuItem extends StatelessWidget {
  final String imagepath;
  final String title;
  final double width;
  final void Function()? function;
  final bool? lastItem;
  const MenuItem({
    required this.imagepath,
    required this.title,
    required this.width,
    required this.function,
    this.lastItem = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //    color: Colors.white,
        border: Border(
          top: const BorderSide(color: Color(0XFF5F3FA3)),
          bottom: lastItem!
              ? const BorderSide(color: Color(0XFF5F3FA3))
              : BorderSide.none,
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          svgIcons[imagepath]!,
          width: width,
          color: const Color(0XFFD3CAE6),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0XFFD3CAE6),
          ),
        ),
        onTap: function,
      ),
    );
  }
}
