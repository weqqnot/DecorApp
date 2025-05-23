import 'package:flutter/material.dart';
import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';

import '../../../data/models/product.dart';
import '../favorite_dialog.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;


  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: FontsApp.title(color: ColorsApp.terra)),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: ColorsApp.beige,
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    product.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 16),
                Text(product.title, style: FontsApp.title(fontSize: 22, color: ColorsApp.orangeDark)),
                SizedBox(height: 8),
                Text(product.desc, style: FontsApp.subText(fontSize: 14, color: ColorsApp.dark)),
                SizedBox(height: 12),
            Divider(color: ColorsApp.terra, thickness: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   '\$200.00',
                //     style: FontsApp.title(color: ColorsApp.terra),
                // ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        favorite(context, product);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.title} đã thêm vào danh sách yêu thích')),);
                      },
                      icon: Image.asset('assets/vectors/favorite.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/vectors/Bot-Add.png'),
                    ),
                  ],
                ),
              ],
            ),
                // Spacer(),
                // ElevatedButton(
                //   onPressed: () {
                //     // Thêm vào giỏ hàng hoặc mua hàng
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: ColorsApp.orangeDark,
                //     padding: EdgeInsets.symmetric(vertical: 14),
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //     minimumSize: Size.fromHeight(50),
                //   ),
                //   child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 16)),
                // ),
        ]),)
      );
  }
}
