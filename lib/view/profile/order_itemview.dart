import 'package:agriplant/utils/utils.dart';
import 'package:agriplant/view/profile/order_product_itemview.dart';
import 'package:flutter/material.dart';

import '../../model/order.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView(
      {Key? key, required this.orderItem, this.visibleProducts = 2})
      : super(key: key);

  final Order orderItem;
  final int visibleProducts;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var totalPrice =
        orderItem.products.fold(0.0, (acc, element) => acc + element.price);
    var productsList = orderItem.products.take(visibleProducts).toList();
    return Card(
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 0.2, color: Colors.grey.shade400),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  orderItem.id,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "(${orderItem.products.length} items)",
                  style: theme.textTheme.bodySmall,
                ),
                5.pw,
                Text(
                  "₹${totalPrice.toStringAsFixed(2)}",
                )
              ],
            ),
            16.ph,
            ...List.generate(productsList.length, (index) {
              return OrderProductItemView(
                  order: orderItem, product: productsList[index]);
            }),
            if (orderItem.products.length > 2)
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.background,
                          ),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(14),
                            itemCount: orderItem.products.length,
                            itemBuilder: (context, index) {
                              final product = orderItem.products[index];
                              return OrderProductItemView(
                                  order: orderItem, product: product);
                            },
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_right_rounded),
                  label: const Text("View all"),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
