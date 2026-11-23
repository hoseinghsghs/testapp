import '../../../../core/network/api_client.dart';
import '../models/product.dart';

class ProductRepository {
  final ApiClient apiClient;

  ProductRepository(this.apiClient);

  Future<List<Product>> getProducts() async {
    final response = await apiClient.get('/products');

    final List data = response.data['data'];

    return data.map((item) {
      return Product.fromJson(item);
    }).toList();
  }
}
