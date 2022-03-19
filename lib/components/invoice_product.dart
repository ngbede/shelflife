import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/pays_icon.dart';
import 'package:intl/intl.dart';

import '../utils/icons.dart';

class InvoiceProduct extends StatelessWidget {
  final String productName;
  final double totalPrice;
  final bool isPAYS;
  const InvoiceProduct({
    Key? key,
    required this.productName,
    required this.totalPrice,
    this.isPAYS = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat _currency = NumberFormat("###,###");
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0XFFE1E1E1)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                isPAYS
                    ? PAYSIcon()
                    : SvgPicture.asset(
                        svgIcons["POD"]!,
                        width: 25,
                      ),
                const SizedBox(width: 5),
                Text(productName),
              ],
            ),
            Text("₦${_currency.format(totalPrice)}")
          ],
        ),
      ),
    );
  }
}
