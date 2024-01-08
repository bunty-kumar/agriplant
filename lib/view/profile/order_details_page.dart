import 'package:agriplant/utils/date.dart';
import 'package:agriplant/view/profile/order_itemview.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../model/order.dart';
import '../../utils/order_status.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key, required this.orderItem}) : super(key: key);

  final Order orderItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orderTimelines = OrderStatus.values.map((e) => e.name).toList();

    var steps = OrderStatus.values;
    int activeStep = steps.indexOf(orderItem.orderStatus);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep:
                activeStep == steps.length - 1 ? activeStep + 1 : activeStep,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: theme.colorScheme.primary,
            stepRadius: 8,
            lineStyle: LineStyle(
              defaultLineColor: Colors.grey.shade300,
              lineLength:
                  (MediaQuery.of(context).size.width * 0.7) / steps.length,
            ),
            steps: List.generate(orderTimelines.length, (index) {
              return EasyStep(
                icon: const Icon(Icons.local_shipping),
                finishIcon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                title: orderTimelines[index],
                topTitle: true,
              );
            }),
            onStepReached: (index) {},
          ),
          const SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order: ${orderItem.id}",
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        backgroundColor:
                            theme.colorScheme.primaryContainer.withOpacity(0.4),
                        labelPadding: EdgeInsets.zero,
                        avatar: const Icon(Icons.fire_truck),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        label: Text(
                          orderTimelines[activeStep],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery estimate"),
                      Text(
                        orderItem.deliverDate.formatDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Jessi Williams",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.home, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "6844 Hall Spring Suite 134\n East Annabury, OK 42291",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.phone, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "233 5447 51048",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment method"),
                      Text(
                        "Credit Card **1234",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          OrderItemView(
            visibleProducts: 1,
            orderItem: orderItem,
          ),
        ],
      ),
    );
  }
}
