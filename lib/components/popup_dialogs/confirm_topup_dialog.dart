import 'package:flutter/material.dart';
import 'package:shelflife/components/invoice_product.dart';
import 'package:shelflife/components/popup_dialogs/header_strip.dart';
import 'package:shelflife/components/sub_total.dart';

import '../custom_button.dart';
import '../redirect_link.dart';

// This component is for the request top up view
class ConfirmTopDialog extends StatelessWidget {
  const ConfirmTopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 8,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderStrip(title: "Adding to invoice:"),
            const Padding(
              padding: EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Text(
                "1 x Pay As You Sell product",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const InvoiceProduct(
              productName: "Bunto blood Caps x 10",
              totalPrice: 6372,
            ),
            const InvoiceProduct(
              productName: "Ventolin Inhaler",
              totalPrice: 872,
              isPAYS: false,
            ),
            const InvoiceProduct(
              productName: "Ventolin Inhaler",
              totalPrice: 872,
              isPAYS: false,
            ),
            const InvoiceProduct(
              productName: "Ventolin Inhaler",
              totalPrice: 872,
              isPAYS: false,
            ),
            const SubTotalStrip(totalPrice: 52338),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "I understand that by proceeding these items will be added to my invoice.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              color: const Color(0XFFF3F4F6),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: "Agree and proceed",
                    function: () {
                      print("Post top up request to FS API");
                    },
                    verticalPad: 20,
                    horizontalPad: 20,
                    textSize: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RedirectLink(
                          title: "Go back and review",
                          includeArrow: false,
                          boldTitle: false,
                          titleSize: 17,
                          textColor: const Color(0XFF2E3441),
                          function: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
