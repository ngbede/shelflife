import 'package:flutter/material.dart';
import 'package:shelflife/components/custom_button.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final String infoText;
  final double height;
  final String buttonLabel;
  // passing this unto the customButton component
  final String? iconPath;
  final bool hasIcon;
  final int? flex;
  final void Function()? function;
  const ButtonCard({
    Key? key,
    required this.title,
    required this.infoText,
    required this.buttonLabel,
    this.flex = 1,
    this.height = 10,
    this.hasIcon = true,
    this.iconPath,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: flex!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0XFF4D2999),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      infoText,
                      style: const TextStyle(
                        //  letterSpacing: 1,
                        color: Color(0xFF949494),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: CustomButton(
                  title: buttonLabel,
                  hasIcon: hasIcon,
                  iconPath: iconPath,
                  function: function,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
