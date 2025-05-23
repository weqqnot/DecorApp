import 'package:flutter/material.dart';

import '../../../data/models/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onTap;
  final Function(Product) onFavorite;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const ProductGrid({
    Key? key,
    required this.products,
    required this.onTap,
    required this.onFavorite,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () => onTap(product),
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                    Text(product.title),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
