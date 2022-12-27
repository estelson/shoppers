import 'package:flutter/material.dart';
import 'package:shoppers/components/custom_button.dart';
import 'package:shoppers/components/list_card.dart';
import 'package:shoppers/utils/custom_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final carts = ["1", "2"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return const ListCard();
            },
          ),
          priceFooter(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: CustomButton(
              text: "CHECKOUT",
              onPress: () {},
              isLoading: false,
            ),
          ),
        ],
      ),
    );
  }

  priceFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text("Total: ", style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text("\$ price", style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
