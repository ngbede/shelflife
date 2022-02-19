// Status card's describe details for a shipment

import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String info;
  final Color borderColor;
  const StatusCard({
    Key? key,
    required this.title,
    required this.info,
    this.borderColor = const Color(0XFFE1E1E1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(title),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Container(
                color: borderColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    info,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
