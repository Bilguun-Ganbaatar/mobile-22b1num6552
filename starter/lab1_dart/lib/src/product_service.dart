import 'dart:convert';

import 'order_status.dart';
import 'product.dart';

const sampleProductsJson = '''
[
  {"id": 1, "title": "Wireless Headphones", "description": "Bluetooth 5.3, 30 цагийн батарей",
   "price": 59.99, "discountPercentage": 10, "rating": 4.5, "stock": 12,
   "category": "electronics", "thumbnail": ""},
  {"id": 2, "title": "Smart Watch", "description": "Зүрхний цохилт, алхам тоолуур",
   "price": 120, "discountPercentage": 15.5, "rating": 4.2, "stock": 0,
   "category": "electronics", "thumbnail": ""},
  {"id": 3, "title": "Leather Backpack", "description": "Арьсан үүргэвч",
   "price": 45.5, "rating": 4.8, "stock": 7, "category": "fashion"},
  {"id": 4, "title": "Running Shoes", "price": 89.9, "discountPercentage": 20,
   "rating": 4.6, "stock": 3, "category": "sports"},
  {"id": 5, "title": "Desk Lamp", "description": "LED ширээний гэрэл",
   "price": 25, "rating": 3.9, "stock": 20, "category": "home"}
]
''';

class ProductService {
  final Duration delay;
  final bool shouldFail;

  ProductService({
    this.delay = const Duration(milliseconds: 300),
    this.shouldFail = false,
  });

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Сүлжээний алдаа');
    }

    final data = jsonDecode(sampleProductsJson) as List<dynamic>;

    return data
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<Product>> searchProducts(String query) async {
    final products = await fetchProducts();
    final search = query.trim().toLowerCase();

    if (search.isEmpty) {
      return products;
    }

    return products
        .where((product) => product.title.toLowerCase().contains(search))
        .toList();
  }
}

Future<String> loadProductsMessage(ProductService service) async {
  try {
    final products = await service.fetchProducts();
    return 'Ачааллаа: ${products.length} бараа';
  } catch (error) {
    return 'Алдаа: $error';
  }
}

Stream<OrderStatus> trackOrder(
  OrderStatus from, {
  Duration step = const Duration(milliseconds: 200),
}) async* {
  var current = from;

  while (true) {
    yield current;

    final next = current.next;

    if (next == null) {
      break;
    }

    await Future.delayed(step);
    current = next;
  }
}
