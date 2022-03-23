import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// The sub total strip we see on confirm topup screen
class SubTotalStrip extends StatelessWidget {
  final double totalPrice;
  const SubTotalStrip({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat _currency = NumberFormat("###,###");
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0XFF362853),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Sub-total to pay",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "₦${_currency.format(totalPrice)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
