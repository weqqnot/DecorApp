import 'package:decor_home_app/features/presentation/widgets/product/product_detail_item.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {

  final List<Product> kitchenProducts = [
    Product('1', 'assets/images/kitchen/kitchen.png', 'Kitchen Hutch', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/kitchen/cabinet.png', 'Vintage Cabinet', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/kitchen/shelving.png', 'Marble Shelving', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/kitchen/kichen_shelving.png', 'Kitchen Shelving', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: kitchenProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final product = kitchenProducts[index];
          return ProductCard(
            product: product,
            onFavorite: () {
              // Xử lý khi nhấn favorite
              favorite(context, product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.title} marked as favorite')),
              );
            },
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
            },
          );
        },
      ),
    );
  }
}
