import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/pays_icon.dart';
import 'package:shelflife/models/product.dart';
import 'package:shelflife/utils/icons.dart';

// product selection component on the topup page

class TopupPicker extends StatelessWidget {
  final Product product;
  final bool showBottomBorder;
  final void Function()? function;
  const TopupPicker({
    required this.product,
    required this.showBottomBorder,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: const BorderSide(color: Color(0XFFE1E1E1)),
            bottom: showBottomBorder // TODO
                ? const BorderSide(color: Color(0XFFE1E1E1))
                : BorderSide.none,
          ),
        ),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                  children: [
                    product.selected
                        ? SizedBox(
                            width: 4,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                width: 2,
                                color: const Color(0XFF362852),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    product.type == "pay_as_you_sell"
                        ? const PAYSIcon()
                        : SvgPicture.asset(
                            svgIcons["POD"]!,
                            width: 25,
                          ),
                    Text(
                      product.fullName,
                      style: TextStyle(
                        fontSize: 16,
                        color: product.selected
                            ? const Color(0XFF362852)
                            : Colors.black,
                        fontWeight: product.selected ? FontWeight.bold : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  // TODO: check icon is so inefficient

                  //  product.selected
                  //       ? SvgPicture.asset(
                  //           svgIcons["checkMark"]!,
                  //           width: 15,
                  //           color: const Color(0XFF4D2999),
                  //         )
                  //       : const SizedBox(),
                  Text(
                    " ${product.selected ? ' SELECTED' : ' SELECT'}",
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: product.selected
                          ? const Color(0XFF362853)
                          : const Color(0XFF4D2999),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
