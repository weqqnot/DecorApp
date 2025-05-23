import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/models/product.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';
import '../../widgets/product/product_detail_item.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  @override
  final List<Product> livingProducts = [
    Product('1','assets/images/lounge_sofa.png', 'Luxe Lounge Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),    Product('7','assets/images/green_bed.png', 'Green Bed', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/con_sofa.png', 'Contemporary Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/chest_sofa.png', 'Chesterfield Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/scan_sofa.png', 'Scandianavian Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('5','assets/images/blue_sofa.png', 'Blue Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('6','assets/images/velvet_sofa.png', 'Velvet Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: livingProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = livingProducts[index];
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
