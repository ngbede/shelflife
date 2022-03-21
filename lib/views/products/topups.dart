// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/custom_button.dart';
import 'package:shelflife/components/inputfield.dart';
import 'package:shelflife/controllers/topup_controller.dart';
import 'package:shelflife/views/products/confirm_topup.dart';
import 'package:shelflife/models/sample_products.dart';
import 'package:shelflife/utils/icons.dart';

// TODO: Refactor the screen
// TODO: Add some seprate state logic for now
// TODO: Add radio button for sorting products alphabetically
class Topups extends StatefulWidget {
  const Topups({Key? key}) : super(key: key);

  @override
  _TopupsState createState() => _TopupsState();
}

bool _selected = false;

class _TopupsState extends State<Topups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFFFFFFFF),
          elevation: 1,
          titleSpacing: 5,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              "go back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: RotatedBox(
              quarterTurns: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  svgIcons["arrow"]!,
                ),
              ),
            ),
          ),
          bottom: const PreferredSize(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10, left: 8),
                child: Text(
                  "Select products for top up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(25),
          ),
          leadingWidth: 27,
        ),
        backgroundColor: const Color(0XFFF3F4F6),
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final topupNotifier = ref.watch(topupProvider.notifier);
            final topupModel = ref.watch(topupProvider);

            return Column(
              children: <Widget>[
                const InputField(name: "Search"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                      itemCount: topupModel.subscriptions!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            topupNotifier.addProduct(
                              topupModel.subscriptions![index],
                            );
                            // print(topupModel.cart);
                            // print(topupModel.products);
                            // print(topupNotifier.subTotalToPay());
                            // print(topupModel.toJson());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: const BorderSide(color: Color(0XFFE1E1E1)),
                                bottom: index == sampleProducts.length - 1
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
                                        topupModel
                                                .subscriptions![index].selected
                                            ? SizedBox(
                                                width: 4,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Container(
                                                    width: 2,
                                                    color:
                                                        const Color(0XFF362852),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        SvgPicture.asset(
                                          svgIcons["POD"]!,
                                          width: 25,
                                        ),
                                        Text(
                                          topupModel
                                              .subscriptions![index].fullName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: topupModel
                                                    .subscriptions![index]
                                                    .selected
                                                ? const Color(0XFF362852)
                                                : Colors.black,
                                            fontWeight: topupModel
                                                    .subscriptions![index]
                                                    .selected
                                                ? FontWeight.bold
                                                : null,
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
                                      // topupNotifier
                                      //         .pharmacyProducts[index].selected
                                      //     ? SvgPicture.asset(
                                      //         svgIcons["checkMark"]!,
                                      //         width: 15,
                                      //         color: const Color(0XFF4D2999),
                                      //       )
                                      //     : const SizedBox(),
                                      Text(
                                        " ${topupModel.subscriptions![index].selected ? ' SELECTED' : ' SELECT'}",
                                        style: TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.bold,
                                          color: topupModel
                                                  .subscriptions![index]
                                                  .selected
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
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0XFFE1E1E1)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${topupModel.cart!.length} products selected",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CustomButton(
                          title: "Request top-up",
                          hasIcon: true,
                          rightSide: true,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConfirmTopup(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
