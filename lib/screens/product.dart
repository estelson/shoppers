import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/components/custom_button.dart';
import 'package:shoppers/utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });

    // Add to cart
    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://www.publicdomainpictures.net/pictures/390000/velka/a-pair-of-old-combat-boots.jpg",
                        ),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Container(
                          decoration: const ShapeDecoration(
                            color: CustomTheme.yellow,
                            shape: CircleBorder(),
                            shadows: [
                              BoxShadow(color: CustomTheme.grey, blurRadius: 3, offset: Offset(1, 3)),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.share),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Text("title"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: const [
                                Text("MRP: "),
                                Text("\$ price"),
                              ],
                            ),
                          ),
                          CustomButton(text: "ADD TO CART", onPress: onAddToCart, isLoading: addButtonLoad),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "About the items",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "the items description",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 35,
              left: 30,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(blurRadius: 3, offset: Offset(1, 3), color: CustomTheme.grey),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
