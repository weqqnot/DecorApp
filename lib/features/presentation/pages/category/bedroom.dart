import 'package:decor_home_app/features/presentation/widgets/product/product_detail_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';

class Bedroom extends StatefulWidget {
  const Bedroom({super.key});

  @override
  State<Bedroom> createState() => _BedroomState();
}

class _BedroomState extends State<Bedroom> {

  final List<Product> bedroomProducts = [
    Product('1', 'assets/images/single_bed.png', 'Single Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/green_bed.png', 'Green Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/brown_bed.png', 'Brown Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/king_bed.png', 'King Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('5','assets/images/stylish_bed.png', 'Stylish Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('6','assets/images/full_bed.png', 'Full Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: bedroomProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = bedroomProducts[index];
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
