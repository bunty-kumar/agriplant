import 'package:agriplant/model/product.dart';
import 'package:agriplant/view/home/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 0.2, color: Colors.grey.shade400),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.image),
                ),
              ),
              child: SizedBox(
                height: 30,
                width: 30,
                child: IconButton.filledTonal(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "\₹${product.price}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: "/${product.unit}",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ])),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton.filled(
                            iconSize: 18,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.plus)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
