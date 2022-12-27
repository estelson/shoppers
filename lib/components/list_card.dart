import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/utils/custom_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      decoration: CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "https://www.publicdomainpictures.net/pictures/450000/velka/mermaid-vintage-art.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "title",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Qty: 1",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "\$ price",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
