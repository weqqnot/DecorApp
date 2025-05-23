import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/models/product.dart';
import '../../../search/search.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';
import '../../widgets/product/product_detail_item.dart';
import '../category/bedroom.dart';
import '../category/decor_light.dart';
import '../category/living_room.dart';

class SpecialOfferPage extends StatefulWidget {
  const SpecialOfferPage({super.key});

  @override
  State<SpecialOfferPage> createState() => _SpecialOfferPageState();
}

class _SpecialOfferPageState extends State<SpecialOfferPage> {

  final List<Product> specialOffer = [
    Product('1','assets/images/lounge_sofa.png', 'Luxe Lounge Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/stylish_oclock.png', 'Stylish Clock', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/nightstand.png', 'Seremity Nightstand', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/stylish_sofa.png', 'Stylish Sofa', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('5','assets/images/white_organizer.png', 'White Organizer', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('6','assets/images/centerpiece.png', 'Table Centerpiece', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
  ];



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: specialOffer.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = specialOffer[index];
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

// Scaffold(
// appBar: AppBar(
// title: Text('Living Room', style: FontsApp.title(color: ColorsApp.terra)),
// centerTitle: true,
// backgroundColor: Colors.white,
// elevation: 0,
// ),
// body:
