import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers/components/custom_button.dart';
import 'package:shoppers/components/list_card.dart';
import 'package:shoppers/components/loader.dart';
import 'package:shoppers/models/cart.dart';
import 'package:shoppers/utils/application_state.dart';
import 'package:shoppers/utils/common.dart';
import 'package:shoppers/utils/custom_theme.dart';
import 'package:shoppers/utils/firestore.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // final carts = ["1", "2"];

  Future<List<Cart>>? carts;
  bool _isCheckoutButtonLoading = false;

  @override
  void initState() {
    super.initState();

    carts = FirestoreUtil.getCart(Provider.of<ApplicationState>(context, listen: false).user);
  }

  void checkout() async {
    setState(() {
      _isCheckoutButtonLoading = true;
    });

    String error = await CommonUtil.checkOutFlow(Provider.of<ApplicationState>(context, listen: false).user!);
    if(error.isEmpty) {
      // ignore: use_build_context_synchronously
      CommonUtil.showAlert(context, "Success", "Yout order is placed");
    } else {
      // ignore: use_build_context_synchronously
      CommonUtil.showAlert(context, "Alert", error);
    }

    // checkout flow
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isCheckoutButtonLoading = false;
      
      carts = FirestoreUtil.getCart(Provider.of<ApplicationState>(context, listen: false).user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: carts,
      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
        if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListCard(cart: snapshot.data![index]);
                  },
                ),
                priceFooter(snapshot.data!),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: CustomButton(
                    text: "CHECKOUT",
                    onPress: () {
                      checkout;
                    },
                    isLoading: false,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.data != null && snapshot.data!.isEmpty) {
          return const Center(
            child: Icon(
              Icons.add_shopping_cart_sharp,
              color: CustomTheme.yellow,
              size: 150,
            ),
          );
        }

        return Center(
          child: Loader(),
        );
      },
    );
  }

  priceFooter(List<Cart> carts) {
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
                Text("\$ ${FirestoreUtil.getCartTotal(carts).toString()}", style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
