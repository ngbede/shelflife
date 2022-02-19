// The card component that contains all the products FS recommends user to add to their subs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shelflife/components/product_picker.dart';
import 'package:shelflife/components/redirect_link.dart';
import 'package:shelflife/utils/icons.dart';

// dynamically add products to column from the product object
class RecommendationCard extends StatelessWidget {
  final String headerIcon;
  final Color? iconColor;
  final String headerTitle;
  final String headerInfo;
  final Map<String, dynamic>? products;
  const RecommendationCard({
    Key? key,
    required this.headerIcon,
    required this.headerTitle,
    required this.headerInfo,
    this.iconColor,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: SvgPicture.asset(
                    svgIcons[headerIcon]!,
                    color: iconColor,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        headerTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        headerInfo,
                        style: const TextStyle(
                          color: Color(0XFF6F6A6A),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const ProductPicker(
                productName: "Danacid x96",
                productCategory: "Antacid",
                price: 383,
              ),
              const ProductPicker(
                productName: "Panadol Extra",
                productCategory: "Analgesic",
                price: 1164,
              ),
              const ProductPicker(
                productName: "Flucor Day",
                productCategory: "Cough & Relief",
                price: 522,
              ),
              const ProductPicker(
                productName: "Imodium",
                productCategory: "Antidiarrhoeal",
                price: 782,
              ),
              const ProductPicker(
                productName: "Ventolin Inhaler",
                productCategory: "Antiasthmatic",
                price: 1122,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(),
                    Text("1/2"),
                    RedirectLink(
                      title: "next",
                      underlineText: false,
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
