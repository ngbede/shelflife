import 'package:flutter/material.dart';
import 'package:shelflife/components/popup_dialogs/header_strip.dart';

// This component is for the request top up view
class ConfirmTopDialog extends StatelessWidget {
  const ConfirmTopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 160,
        horizontal: 8,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
