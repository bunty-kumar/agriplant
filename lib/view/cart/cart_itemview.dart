import 'dart:async';

import 'package:agriplant/model/product.dart';
import 'package:flutter/material.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({Key? key, required this.cartItem}) : super(key: key);

  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
              label: "Keep",
              onPressed: () {
                completer.complete(false);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
            content: const Text(
              "Remove from cart?",
            ),
          ),
        );
        Timer(const Duration(seconds: 1), () {
          if (!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          }
        });
        return await completer.future;
      },
      child: SizedBox(
        height: 125,
        child: Card(
          elevation: 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 0.2, color: Colors.grey.shade400),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                // image of product
                Container(
                  width: 90,
                  height: double.infinity,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image),
                    ),
                  ),
                ),
                // other info of cart product
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        cartItem.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        cartItem.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${cartItem.price}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              onPressed: (index) {
                                if (index == 0) {
                                  // - button clicked
                                } else if (index == 2) {
                                  // + plus button clicked
                                }
                              },
                              borderRadius: BorderRadius.circular(16),
                              isSelected: const [true, false, true],
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              constraints: const BoxConstraints(
                                  minHeight: 30, minWidth: 30),
                              children: const [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                Text("2"),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
