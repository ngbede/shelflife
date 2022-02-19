import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelflife/components/base_card.dart';
import 'package:shelflife/components/button_card.dart';
import 'package:shelflife/utils/icons.dart';
import 'package:shelflife/components/redirect_link.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Hello, ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Bugons Pharmacy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    svgIcons["wave"]!,
                    width: 30,
                    color: const Color(0XFFAF7E57),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "What's trending in Rivers?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          BaseCard(
            title: "See the top earners this month",
            infoText:
                'Dancid x96 is the product bringing in the most cash in Rivers',
            infoStyle: const TextStyle(fontSize: 16),
            linkText: "See the fast moving products now",
            iconPath: svgIcons["lightning"]!,
            iconWidth: 30,
            iconColor: const Color(0XFFFCCD31),
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            showIcon: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upcoming service visits",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: BaseCard(
                  title: "NEXT DELIVERY",
                  infoText: "Wednesday 12 Jan",
                  linkText: "Go to deliveries",
                  iconPath: svgIcons["deliveries"]!,
                  height: 160,
                ),
              ),
              Expanded(
                child: BaseCard(
                  title: "NEXT COUNT",
                  infoText: "No details yet",
                  infoStyle: const TextStyle(fontSize: 16),
                  linkText: "Go to counts",
                  iconPath: svgIcons["counts"]!,
                  height: 160,
                ),
              )
            ],
          ),
          SizedBox(
            height: 140,
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Stocked out?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text('Get an emergency top-up for products'),
                          RedirectLink(
                            title: "Request a top-up",
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/retailer-topup-cta.png",
                        width: 80,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your finances",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("No financial data to display yet."),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonCard(
            title: "Talk to us",
            infoText: "Chat with our support about questions you might have",
            buttonLabel: "Chat with us",
            iconPath: svgIcons["intercom"]!,
          )
        ],
      ),
    );
  }
}
