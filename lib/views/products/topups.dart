// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/custom_button.dart';
import 'package:shelflife/components/inputfield.dart';
import 'package:shelflife/components/topup_picker.dart';
import 'package:shelflife/controllers/topup_controller.dart';
import 'package:shelflife/views/products/confirm_topup.dart';
import 'package:shelflife/utils/icons.dart';

// TODO: Add radio button for sorting products alphabetically
class Topups extends StatefulWidget {
  const Topups({Key? key}) : super(key: key);

  @override
  _TopupsState createState() => _TopupsState();
}

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
                        return TopupPicker(
                          product: topupModel.subscriptions![index],
                          showBottomBorder:
                              index == topupModel.subscriptions!.length - 1,
                          function: () {
                            topupNotifier.addProduct(
                              topupModel.subscriptions![index],
                            );
                          },
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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
