// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shelflife/components/button_card.dart';
import 'package:shelflife/components/recommendation_card.dart';
import 'package:shelflife/components/redirect_link.dart';
import 'package:shelflife/views/products/topups.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller1 = ScrollController();
    final ScrollController _controller2 = ScrollController();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ButtonCard(
            title: "21 subscriptions",
            infoText: "active at Bugons Pharmacy",
            buttonLabel: "View all",
            function: () {
              log("Navigate to manage subscription view");
            },
            hasIcon: false,
            flex: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          child: Row(
            children: [
              const Text(
                "Stocked out? ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              RedirectLink(
                title: "Request a top-up",
                titleSize: 16,
                function: () {
                  print("Navigate to top up request screen");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Topups(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          child: Text(
            "Must-have products in Rivers this \nDecember/January",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 11, bottom: 10),
          child: Text(
            "What's in demand in the market around you",
            style: TextStyle(fontSize: 15, color: Color(0XFF6A6C73)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          child: Scrollbar(
            controller: _controller1,
            isAlwaysShown: true,
            radius: const Radius.circular(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controller1,
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: const [
                  RecommendationCard(
                    headerIcon: "fire",
                    iconColor: Color(0XFFF9561D),
                    headerTitle: "Most popular",
                    headerInfo: "The products everyone in Rivers has to have",
                  ),
                  RecommendationCard(
                    headerIcon: "lightning",
                    iconColor: Color(0XFFFCCB31),
                    headerTitle: "Fast movers",
                    headerInfo: "What's flying off shelves around you",
                  ),
                  RecommendationCard(
                    headerIcon: "moneyBag",
                    headerTitle: "Top earners",
                    headerInfo:
                        "The products bringing in the most cash in Rivers",
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10, left: 11, right: 11, top: 20),
          child: Text(
            "Recommended for you",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 11, bottom: 10),
          child: Text(
            "A selection curated by our experts, especially for you",
            style: TextStyle(fontSize: 15, color: Color(0XFF6A6C73)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
          child: Scrollbar(
            controller: _controller2,
            isAlwaysShown: true,
            radius: const Radius.circular(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controller2,
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: const [
                  RecommendationCard(
                    headerIcon: "medal",
                    iconColor: Color(0XFFFEE138),
                    headerTitle: "Top performers",
                    headerInfo: "Most popular products",
                  ),
                  RecommendationCard(
                    headerIcon: "money",
                    headerTitle: "Great prices",
                    headerInfo: "Prices below market. Big gains",
                  ),
                  RecommendationCard(
                    headerIcon: "seasonal",
                    headerTitle: "Seasonal",
                    headerInfo: "Products in demand this season",
                  ),
                  RecommendationCard(
                    headerIcon: "new",
                    headerTitle: "New arrivals",
                    headerInfo: "Find the latest products added",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
