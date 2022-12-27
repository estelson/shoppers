import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shoppers/firebase_options.dart';
import 'package:shoppers/screens/checkout.dart';
import 'package:shoppers/screens/home.dart';
import 'package:shoppers/screens/profile.dart';
import 'package:shoppers/utils/custom_theme.dart';

void main() async {
  // Firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Stripe setup
  final String response = await rootBundle.loadString("assets/config/stripe.json");
  final data = await json.decode(response);
  Stripe.publishableKey = data["publishableKey"];

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EJL Shoppers',
      theme: CustomTheme.getTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("SHOPPERS"),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: CustomTheme.cardShadow,
            ),
            child: const TabBar(
              padding: EdgeInsets.symmetric(vertical: 10),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.shopping_cart)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),

          body: const TabBarView(
            children: [
              HomeScreen(),
              CheckoutScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
