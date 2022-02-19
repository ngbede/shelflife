// The list of products in a shipment card

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/product_label.dart';
import 'package:shelflife/utils/icons.dart';
import 'package:shelflife/components/pays_icon.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String? productQuantity;
  final LabelType subscriptionType;
  const ProductCard({
    Key? key,
    required this.productName,
    this.productQuantity,
    required this.subscriptionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0XFFE1E1E1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                subscriptionType == LabelType.pod
                    ? SvgPicture.asset(
                        svgIcons["POD"]!,
                        width: 25,
                      )
                    : const PAYSIcon(),
                Text(
                  " ${productName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Container(
              color: const Color(0XFFEFEFEF),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "${productQuantity}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
