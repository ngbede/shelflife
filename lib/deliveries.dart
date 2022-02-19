import 'package:flutter/material.dart';
import 'package:shelflife/components/shipment_ard.dart';

class Deliveries extends StatelessWidget {
  const Deliveries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ShipmentCard(
          status: "cancelled",
          title: "Top-up from Shelf Life",
          date: "30 Feb 2022",
          productCount: 11,
          hasPOD: false,
          hasPAYS: true,
          id: 1290,
          route: "phil",
        ),
        ShipmentCard(
          status: "return",
          title: "Return to Shelf Life",
          date: "21 Feb 2022",
          productCount: 7,
          hasPOD: true,
          hasPAYS: true,
          id: 1290,
          route: "phil",
        ),
        ShipmentCard(
          status: "received",
          title: "Top-up from Shelf Life",
          date: "30 May 2022",
          productCount: 1,
          hasPOD: true,
          hasPAYS: false,
          id: 1290,
          route: "phil",
        ),
        ShipmentCard(
          status: "scheduled",
          title: "Top-up from Shelf Life",
          date: "30 May 2022",
          productCount: 1,
          hasPOD: true,
          hasPAYS: false,
          id: 1290,
          route: "phil",
        ),
      ],
    );
  }
}
