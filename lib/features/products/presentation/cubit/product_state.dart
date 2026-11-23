import '../../data/models/product.dart';

// وضعیت‌های مختلف دریافت محصولات
enum ProductStatus { initial, loading, success, error }

// اطلاعات و وضعیت محصولات فروشگاه
class ProductState {
  // وضعیت فعلی دریافت اطلاعات
  final ProductStatus status;

  // پیام خطا (در صورت وجود)
  final String? errorMessage;

  // لیست محصولات
  final List<Product> products;

  // تعداد کل محصولات
  final int totalCount;

  // سازنده کلاس
  const ProductState({
    this.status = ProductStatus.initial,
    this.errorMessage,
    this.products = const [],
    this.totalCount = 0,
  });

  // ساخت یک State جدید با حفظ اطلاعات قبلی
  ProductState copyWith({
    ProductStatus? status,
    String? errorMessage,
    List<Product>? products,
    int? totalCount,
    bool clearErrorMessage = false,
  }) {
    return ProductState(
      status: status ?? this.status,

      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,

      products: products ?? this.products,

      totalCount: totalCount ?? this.totalCount,
    );
  }
}
