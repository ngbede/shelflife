import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/custom_button.dart';
import 'package:shelflife/components/popup_dialogs/confirm_topup_dialog.dart';
import 'package:shelflife/components/popup_dialogs/pays_dialog.dart';
import 'package:shelflife/components/product_label.dart';
import 'package:shelflife/components/redirect_link.dart';
import 'package:shelflife/components/sub_total.dart';
import 'package:shelflife/components/topup_product.dart';

import 'utils/icons.dart';

class ConfirmTopup extends StatefulWidget {
  const ConfirmTopup({Key? key}) : super(key: key);

  @override
  _ConfirmTopupState createState() => _ConfirmTopupState();
}

class _ConfirmTopupState extends State<ConfirmTopup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFFF3F4F6),
          elevation: 0,
          titleSpacing: 5,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              "go back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: RotatedBox(
              quarterTurns: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  svgIcons["arrow"]!,
                ),
              ),
            ),
          ),
          leadingWidth: 27,
        ),
        backgroundColor: const Color(0XFFF3F4F6),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            const Center(
              child: Text(
                "Confirm top-up request",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0XFFE1E1E1)),
                    bottom: BorderSide(color: Color(0XFFE1E1E1)),
                    right: BorderSide(color: Color(0XFFE1E1E1)),
                    left: BorderSide(color: Color(0XFFE1E1E1)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // START: 1st section for name of pharmacy and number of products
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Bugons Pharmacy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        text: const TextSpan(
                          text: "Requesting top-ups for",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: " 1 product:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    // END: of the first section
                    const SizedBox(height: 10),
                    // Start: Second section includes products broken down into their subscription type
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: const [
                          ProductLabel(labelType: LabelType.pays),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "Please note that the most recent balance for these products will be added to your invoice. ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Learn More",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const PAYSDialog(
                                        title:
                                            "Top-ups for pay-as-you-sell subscriptions",
                                      );
                                    },
                                  );
                                },
                              style: const TextStyle(
                                color: Color(0XFF5939A4),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "PRODUCT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF746769),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "ITEM TOTAL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF746769),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const TopupProduct(
                      productName: "Bunto blood Caps",
                      unitsInStock: 12,
                      unitPrice: 404,
                    ),
                    const TopupProduct(
                      productName: "Cap Amoxil (Beecham)",
                      unitsInStock: 10,
                      unitPrice: 4749,
                    ),
                    const SubTotalStrip(totalPrice: 52338),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          "These items will be added to your regular invoice."),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5,
                      ),
                      child: Text(
                          "* Product will be reviewed before the invoice is issued. A Shelf Life team member will be in touch shortly."),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Color(0XFFE1E1E1)),
                    right: BorderSide(color: Color(0XFFE1E1E1)),
                    bottom: BorderSide(color: Color(0XFFE1E1E1)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          title: "Request top-up",
                          function: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ConfirmTopDialog();
                              },
                            );
                          },
                          verticalPad: 20,
                          horizontalPad: 20,
                          textSize: 22,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RedirectLink(
                            title: "Cancel and go back",
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
            )
          ],
        ),
      ),
    );
  }
}
