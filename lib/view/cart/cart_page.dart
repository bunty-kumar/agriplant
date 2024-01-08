import 'package:agriplant/resourses/sample_data.dart';
import 'package:agriplant/utils/utils.dart';
import 'package:agriplant/view/cart/cart_itemview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(3).toList();
    var totalPrice =
        cartItems.map((e) => e.price).reduce((acc, cur) => acc + cur);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...List.generate(cartItems.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CartItemView(cartItem: cartItems[index]),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total(${cartItems.length})"),
            Text(
              "₹$totalPrice",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        16.ph,
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.arrow_right),
          label: const Text("Proceed to Checkout"),
        )
      ],
    );
  }
}
