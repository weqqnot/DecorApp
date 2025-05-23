import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/models/product.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';
import '../../widgets/product/product_detail_item.dart';

class DecorLight extends StatelessWidget {
  const DecorLight({super.key});

  static const List<Product> decorLights = [
    Product('1','assets/images/aluminum_chair.png', 'Modern Lamp', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/aluminum_chair.png', 'Ceiling Light', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/aluminum_chair.png', 'Vintage Lantern', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/aluminum_chair.png', 'Smart Bulb', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: decorLights.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = decorLights[index];
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
