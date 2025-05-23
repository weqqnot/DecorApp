import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const ProductCard({required this.product, this.onTap, this.onFavorite, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Hoặc InkWell nếu cần ripple effect
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorsApp.beige,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 95,
              width: double.infinity,
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(product.title, style: FontsApp.subTitle(color: ColorsApp.dark, fontSize: 15)),
            Text(product.desc, style: FontsApp.subText(color: ColorsApp.orangeDark, fontSize: 13), maxLines: 2),
            SizedBox(height: 6),
            Divider(color: ColorsApp.rosy, thickness: 2),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: onFavorite,
                icon: Image.asset('assets/vectors/favorite.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
