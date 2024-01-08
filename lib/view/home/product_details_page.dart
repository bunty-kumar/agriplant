import 'package:agriplant/resourses/sample_data.dart';
import 'package:agriplant/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../model/product.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showMore = false;
  late TapGestureRecognizer showMoreRecognizer;

  @override
  void initState() {
    showMoreRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    showMoreRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bookmark),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.product.image),
              ),
            ),
          ),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available In Stock",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              Flexible(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "\₹${widget.product.price}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "/${widget.product.unit}",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ])),
              ),
            ],
          ),
          10.ph,
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade600,
              ),
              Text("${widget.product.rating} (192)"),
              const Spacer(),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton.filled(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.minus)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "1 ${widget.product.unit}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton.filled(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.plus)),
              ),
            ],
          ),
          20.ph,
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          5.ph,
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                      text: showMore
                          ? widget.product.description
                          : "${widget.product.description.substring(0, widget.product.description.length - 100)}..."),
                  TextSpan(
                      recognizer: showMoreRecognizer,
                      text: showMore ? "Show Less" : "Read More",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                ]),
          ),
          10.ph,
          Text(
            "Related Products",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          10.ph,
          SizedBox(
            height: 90,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(products[index].image))),
                );
              },
              separatorBuilder: (context, index) {
                return 10.pw;
              },
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
            ),
          ),
          20.ph,
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.cart),
              label: const Text("Add to cart"))
        ],
      ),
    );
  }
}
