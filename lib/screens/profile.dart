import 'package:flutter/material.dart';
import 'package:shoppers/components/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Hi there!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          CustomButton(
            text: "SIGN OUT",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
