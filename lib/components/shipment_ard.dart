// The shipment card can be reused on the count screen

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/pays_icon.dart';
import 'package:shelflife/components/redirect_link.dart';
import 'package:shelflife/delivery_detail.dart';
import 'package:shelflife/static/status_colors.dart';
import 'package:shelflife/utils/icons.dart';

// card type
enum CardType { shipment, stockCount }

class ShipmentCard extends StatelessWidget {
  final String status;
  final String? title;
  final String date;
  final int productCount;
  final bool? hasPOD;
  final bool? hasPAYS;
  final int id;
  final String route;
  final CardType cardType;
  final String? fp;
  final String? dateCreated;
  final String? dateAdjusted;
  final double? height;
  const ShipmentCard({
    Key? key,
    required this.status,
    required this.date,
    required this.productCount,
    this.hasPOD,
    this.hasPAYS,
    required this.id,
    required this.route,
    this.title,
    this.cardType = CardType.shipment,
    this.fp,
    this.dateCreated,
    this.dateAdjusted,
    this.height = 160,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DeliveryDetail(),
          ),
        );
      },
      child: SizedBox(
        height: height,
        child: Card(
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 23,
                color: statusColors[status.toLowerCase()],
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: Text(
                      status.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          mainAxisAlignment: cardType == CardType.shipment
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.start,
                          children: [
                            cardType == CardType.shipment
                                ? Text(
                                    // ignore: unnecessary_string_interpolations
                                    "${title!}",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  )
                                : const SizedBox(),
                            Text(
                              date,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: Text("Products:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Row(
                              children: [
                                Text(
                                  "$productCount products ",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                cardType == CardType.shipment
                                    ? hasPAYS!
                                        ? const PAYSIcon()
                                        : const SizedBox()
                                    : const SizedBox(),
                                const SizedBox(width: 3),
                                cardType == CardType.shipment
                                    ? hasPOD!
                                        ? SvgPicture.asset(
                                            svgIcons["POD"]!,
                                            width: 25,
                                          )
                                        : const SizedBox()
                                    : const SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // ID, Route, Date created, FP, Adjusted on
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("ID: $id Route: $id"),
                            ),
                            const RedirectLink(title: "Details")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
