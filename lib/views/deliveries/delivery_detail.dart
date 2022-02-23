import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shelflife/components/product_card.dart';
import 'package:shelflife/components/product_label.dart';
import 'package:shelflife/components/status_card.dart';

class DeliveryDetail extends StatelessWidget {
  const DeliveryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Arrival from Shelf Life",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black), // will change
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  flex: 2,
                  child: StatusCard(
                    title: "Status",
                    info: "Scheduled",
                    borderColor: Color(0XFFD6F4F0),
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  flex: 2,
                  child: StatusCard(
                    title: "Date",
                    info: "19 Jan 2022",
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  flex: 1,
                  child: StatusCard(
                    title: "ID",
                    info: "8223",
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  flex: 1,
                  child: StatusCard(
                    title: "FP",
                    info: "TBD",
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "This delivery contains the following products:",
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 20, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                ProductLabel(labelType: LabelType.pod),
                Text(
                  "QTY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0XFF666666),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ProductCard(
              productName: "Ventolin Inhaler",
              subscriptionType: LabelType.pod,
              productQuantity: "3",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ProductCard(
              productName: "Aboniki Balm",
              subscriptionType: LabelType.pod,
              productQuantity: "9",
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 20, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                ProductLabel(labelType: LabelType.pays),
                Text(
                  "QTY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0XFF666666),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ProductCard(
              productName: "Zinnat tab 500mg",
              subscriptionType: LabelType.pays,
              productQuantity: "10",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ProductCard(
              productName: "M&B PCM Syrup",
              subscriptionType: LabelType.pays,
              productQuantity: "7",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ProductCard(
              productName: "Panadol Extra",
              subscriptionType: LabelType.pays,
              productQuantity: "20",
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(
                text: "Is there an issue with this delivery? ",
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: "\nContact customer support",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log("pop up the intercom message modal!");
                      },
                    style: const TextStyle(
                      color: Color(0XFF5939A4),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
