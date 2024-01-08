import 'package:agriplant/resourses/img_constant.dart';
import 'package:agriplant/utils/utils.dart';
import 'package:agriplant/view/home/product_item_view.dart';
import 'package:flutter/material.dart';

import '../../resourses/sample_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // search bar and filter
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Here...",
                    isDense: true,
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            8.pw,
            IconButton.filled(
                onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))
          ],
        ),
        // contact us card
        8.ph,
        SizedBox(
          height: 175,
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free Consultation",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.green.shade700),
                        ),
                        const Text(
                          "Get free support from our customer service",
                        ),
                        FilledButton(
                            onPressed: () {}, child: const Text("Call Now"))
                      ],
                    ),
                  ),
                  Image.asset(
                    contactImg,
                    width: 120,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
          ),
        ),
        // featured product title
        8.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Products",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            TextButton(onPressed: () {}, child: const Text("SEE ALL"))
          ],
        ),
        // featured product list
        8.ph,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            return ProductItemView(
              product: products[index],
            );
          },
        )
      ],
    );
  }
}
