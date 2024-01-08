import 'package:agriplant/resourses/sample_data.dart';
import 'package:agriplant/utils/order_status.dart';
import 'package:agriplant/utils/utils.dart';
import 'package:flutter/material.dart';

import 'order_itemview.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    var tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(tabs.length, (index) {
              return Tab(
                text: tabs[index],
              );
            }),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            var filteredOrderList = orders
                .where((element) =>
                    element.orderStatus == OrderStatus.values[index])
                .toList();
            return ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  var orderData = filteredOrderList[index];
                  return OrderItemView(
                    orderItem: orderData,
                  );
                },
                separatorBuilder: (context, index) {
                  return 10.ph;
                },
                itemCount: filteredOrderList.length);
          }),
        ),
      ),
    );
  }
}
