import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier();
});

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final int skip;
  final String searchQuery;
  final String category;

  ProductState({
    this.products = const [],
    this.isLoading = false,
    this.skip = 0,
    this.searchQuery = '',
    this.category = 'all',
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    int? skip,
    String? searchQuery,
    String? category,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      skip: skip ?? this.skip,
      searchQuery: searchQuery ?? this.searchQuery,
      category: category ?? this.category,
    );
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final url = state.category == 'all'
        ? 'https://dummyjson.com/products?limit=10&skip=${state.skip}'
        : 'https://dummyjson.com/products/category/${state.category}?limit=10&skip=${state.skip}';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    final newProducts = (data['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();

    state = state.copyWith(
      products: [...state.products, ...newProducts],
      isLoading: false,
      skip: state.skip + 10,
    );
  }

  void searchProducts(String query) {
    state = state.copyWith(searchQuery: query, skip: 0, products: []);
    loadProducts();
  }

  void filterByCategory(String category) {
    state = state.copyWith(category: category, skip: 0, products: []);
    loadProducts();
  }
}