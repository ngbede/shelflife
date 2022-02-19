import 'package:flutter/material.dart';
import 'package:shelflife/components/shipment_ard.dart';

class Counts extends StatelessWidget {
  const Counts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ShipmentCard(
          status: "submitted",
          date: "20 May 2022",
          productCount: 21,
          id: 9012,
          route: "droww",
          cardType: CardType.stockCount,
        )
      ],
    );
  }
}
