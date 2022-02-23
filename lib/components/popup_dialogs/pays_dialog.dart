import 'package:flutter/material.dart';
import 'package:shelflife/components/custom_button.dart';
import 'package:shelflife/components/popup_dialogs/header_strip.dart';
import '../../utils/learn_more.dart';

// THis component provides info concerning PAYS topup sproducts
class PAYSDialog extends StatelessWidget {
  final String title;
  const PAYSDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 160,
        horizontal: 8,
      ),
      child: Card(
        child: Column(
          children: [
            HeaderStrip(title: title),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              child: Text(
                learnMoreText["PAYS"]![0],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Text(
                learnMoreText["PAYS"]![1],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: "Close",
                  function: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
