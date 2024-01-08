import 'package:agriplant/utils/order_status.dart';
import '../model/order.dart';
import '../model/product.dart';
import '../model/service.dart';
import 'img_constant.dart';

List<Product> products = [
  const Product(
    name: "Tractor",
    description:
        "Exence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
    image: tractorImg,
    price: 377.00,
    unit: 'day(s)',
    rating: 4.35,
  ),
  const Product(
    name: "Fresh Fruits",
    description:
        "Indulge in the natural sweetness and goodness of our handpicked assortment of fresh fruits. Bursting with flavors and packed with nutrients, these delectable treats are ect for snacking, cooking, or adding a vibrant touch to your meals.",
    image: fruitImg,
    price: 9.99,
    unit: 'kg',
    rating: 3.86,
  ),
  const Product(
    name: "Gardener's Rake",
    description:
        "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
    image: rakeImg,
    price: 8.44,
    unit: 'piece',
    rating: 4.18,
  ),
  const Product(
    name: "Premium Seeds",
    description:
        "Embark on a journey of cultivation with our premium seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
    image: seedImg,
    price: 14.52,
    unit: 'kg',
    rating: 5.0,
  ),
  const Product(
    name: "Sturdy Shovel",
    description:
        "Conquer your landscaping and gardening tasks with our durable and versatile shovel. Built to withstand demanding work, its ergonomic handle and robust blade make digging, lifting, and moving materials a breeze. Elevate your outdoor projects with this essential tool.",
    image: shovelImg,
    price: 14.77,
    unit: 'piece',
    rating: 5.0,
  ),
  const Product(
    name: "Juicy Tomatoes",
    description:
        "Add a pop of color and flavor to your dishes with our juicy tomatoes. Grown with care, these plump and succulent tomatoes are a kitchen staple. Whether you're making sauces, salads, or sandwiches, these tomatoes are the key to culinary delight.",
    image: tomatoImg,
    price: 6.84,
    unit: 'kg',
    rating: 3.22,
  ),
];

List<Service> services = [
  const Service(
    name: "Seeds",
    image: seedsImg,
  ),
  const Service(
    name: "Seedlings",
    image: seedlingsImg,
  ),
  const Service(
    name: "Machinery",
    image: machineryImg,
  ),
  const Service(
    name: "Hire Worker",
    image: workersImg,
  ),
  const Service(
    name: "Cultivation process",
    image: cultivationImg,
  ),
  const Service(
    name: "Crop disease solution",
    image: cropDiseaseImg,
  ),
];

List<Order> orders = [
  Order(
    id: "202304a5",
    products: products.reversed.take(3).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.delivered,
  ),
  Order(
    id: "202204jm",
    products: products.take(3).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.processing,
  ),
  Order(
    id: "202204jm",
    products: products.take(1).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.processing,
  ),
  Order(
    id: "202204jm",
    products: products.take(2).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.processing,
  ),
  Order(
    id: "202204jm",
    products: products.take(2).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.shipping,
  ),
  Order(
    id: "202204jm",
    products: products.take(2).toList(),
    orderDate: DateTime.utc(2023, 1, 1),
    deliverDate: DateTime.utc(2023, 1, 1),
    orderStatus: OrderStatus.picking,
  ),
];
