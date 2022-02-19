import 'package:flutter/material.dart';

class NoInvoiceCard extends StatelessWidget {
  const NoInvoiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0XFF4D2999),
              width: 5,
            ),
            right: BorderSide(
              color: Color(0XFF4D2999),
              width: 1,
            ),
            left: BorderSide(
              color: Color(0XFF4D2999),
              width: 1,
            ),
            bottom: BorderSide(
              color: Color(0XFF4D2999),
              width: 1,
            ),
          ),
          // borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "No invoices available.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "If you believe this to be an error, please contact our support team for help",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
