import 'package:decor_home_app/features/data/models/product.dart';

class FavoriteBoard {
  final String id;
  String name;
  final List<Product> products;

  FavoriteBoard({
    required this.id,
    required this.name,
    required this.products,
  });

  FavoriteBoard copyWith({
    String? id,
    String? name,
    List<Product>? products,
  }) {
    return FavoriteBoard(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
    );
  }}


