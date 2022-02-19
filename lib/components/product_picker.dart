// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/utils/icons.dart';
import 'package:intl/intl.dart';

class ProductPicker extends StatelessWidget {
  final String productName;
  final String productCategory;
  final double price;
  final bool checkProduct; // use this for the checking of product logic
  const ProductPicker({
    Key? key,
    required this.productName,
    required this.productCategory,
    required this.price,
    this.checkProduct = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat currency = NumberFormat("###,###");
    return ListTile(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          RichText(
            text: TextSpan(
                text: "₦${currency.format(price.toInt())}  ",
                style: const TextStyle(
                  color: Color(0XFF32A197),
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "$productCategory",
                    style: const TextStyle(
                      color: Color(0XFF72726E),
                    ),
                  )
                ]),
          )
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0XFF4D2999),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            svgIcons["plus"]!,
            width: 10,
            color: const Color(0XFF4D2999),
          ),
        ),
      ),
    );
  }
}
