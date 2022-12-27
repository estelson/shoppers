import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/utils/custom_theme.dart';

class GridCard extends StatelessWidget {
  final int index;
  final void Function() onPress;

  const GridCard({Key? key, required this.index, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0 ? const EdgeInsets.only(left: 22) : const EdgeInsets.only(right: 22),
      decoration: CustomTheme.getCardDecoration(),
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "https://www.publicdomainpictures.net/pictures/390000/velka/a-pair-of-old-combat-boots.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "Title",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      "Price",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
