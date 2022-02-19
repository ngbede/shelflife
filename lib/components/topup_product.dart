import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This component is used in the topup confirmation screen

class TopupProduct extends StatelessWidget {
  final String productName;
  final int unitsInStock;
  final int unitPrice;
  // could remove this field later on since we already have the qty and unit price
  final int? totalPrice;

  const TopupProduct({
    Key? key,
    required this.productName,
    required this.unitsInStock,
    required this.unitPrice,
    this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat _currency = NumberFormat("###,###");
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0XFFE1E1E1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "$productName\n",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "You had $unitsInStock units x ",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: "₦${_currency.format(unitPrice)}",
                  style: const TextStyle(
                    color: Color(0XFF2FA097),
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Text(
            "₦${totalPrice ?? _currency.format(unitPrice * unitsInStock)}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
