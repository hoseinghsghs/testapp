import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/features/products/data/models/product.dart';

void main() {
  group('Product.fromJson', () {
    test('maps all fields from API JSON', () {
      final product = Product.fromJson({
        'id': 12,
        'name': 'Test Product',
        'slug': 'test-product',
        'price': 250000,
        'stock': 8,
        'is_active': true,
      });

      expect(product.id, 12);
      expect(product.name, 'Test Product');
      expect(product.slug, 'test-product');
      expect(product.price, 250000);
      expect(product.stock, 8);
      expect(product.isActive, isTrue);
    });

    test('maps an inactive product', () {
      final product = Product.fromJson({
        'id': 13,
        'name': 'Inactive Product',
        'slug': 'inactive-product',
        'price': 100,
        'stock': 0,
        'is_active': false,
      });

      expect(product.isActive, isFalse);
      expect(product.stock, 0);
    });
  });
}
