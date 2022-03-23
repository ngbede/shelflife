import 'package:flutter/material.dart';
import 'package:shelflife/layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelflife/models/location.dart';

// a provider is no type,t global only the provider definition is global
final pharmacy = Provider(
  (ref) => Location(
    id: "country:ng:state:rivers:sdp:bugons-pharmacy",
    fullName: "Bugons Pharmacy",
    type: "location",
    level: "sdp",
    location: "country:ng:state:rivers",
    additionalData: {
      "addressDescription": "Woji",
      "latLng": "NA",
      "physicalAddress": "101 Nvigwe Road, Woji",
      "tracksPartnerBalances": true,
      "statusId": "other",
      "city": "Port Harcourt",
      "classification": "Pharmacy",
      "code": "BUP",
      "level": "5",
      "locationType": "Stand-alone Building",
      "mobilizedDate": "2020-01-23",
      "paymentTerms": 5,
      "serviceFee": 1750,
      "visitDay": "Thursday",
      "zone": "Woji",
      "active": false,
      "uuid": "ac023365-beb9-4cbc-be6b-9eb7e74dc9fd",
      "gsID": 264,
      "ordersStatus": "active"
    },
    contacts: {
      "program:shelflife": {
        "name": "Ugochi Ben-Njoku",
        "phone": "002348035988906",
        "email": "ugochben@yahoo.com"
      }
    },
  ),
);
final integers = Provider((ref) => 2);
//final sampleProd = Provider((_) => Product(fullName: "Emmanuel", price: 22));
final myAutoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);
final myFamilyProvider = Provider.family<String, int>((ref, id) => '$id');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shelflife',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primaryColorLight: Colors.white,
        // primaryColorDark: Colors.black,
        primaryColor: Colors.blue,
      ),
      home: const SafeArea(
        child: Layout(),
      ),
    );
  }
}
