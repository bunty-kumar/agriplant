import 'package:agriplant/model/product.dart';
import '../utils/order_status.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderDate;
  final DateTime deliverDate;
  final OrderStatus orderStatus;

  Order(
      {required this.id,
      required this.products,
      required this.orderDate,
      required this.deliverDate,
      required this.orderStatus});
}
