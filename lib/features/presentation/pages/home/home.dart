import 'package:decor_home_app/features/navigator/tabbar.dart';
import 'package:decor_home_app/features/presentation/pages/home/special_offer.dart';
import 'package:decor_home_app/features/presentation/widgets/category/category_item.dart';
import 'package:decor_home_app/features/presentation/widgets/product/product_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:decor_home_app/features/data/models/product.dart';
import 'package:decor_home_app/features/presentation/widgets/auto_image_slide.dart';
import 'package:decor_home_app/features/presentation/widgets/best_sell_card.dart';
import 'package:decor_home_app/features/search/search.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../widgets/favorite_dialog.dart';
import '../../widgets/product/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> demoProducts = [
    Product('1','assets/images/aluminum_chair.png', 'Aluminum Chair', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('2','assets/images/aluminum_chair.png', 'Aluminum Chair', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('3','assets/images/aluminum_chair.png', 'Aluminum Chair', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
    Product('4','assets/images/aluminum_chair.png', 'Aluminum Chair', 'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SafeArea(
        child: Column(
          children: [
            // Phần header không cuộn
            ListTile(
              title: Text(
                'Hi, Welcome Back',
                style: FontsApp.title(color: ColorsApp.salmon, fontSize: 25),
              ),
              subtitle: Text(
                'Create spaces that bring joy',
                style: FontsApp.subTitle(color: ColorsApp.dark, fontSize: 13),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.search_outlined),
                color: ColorsApp.orangeDark,
                style: IconButton.styleFrom(
                  backgroundColor: ColorsApp.salmon,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
              ),
            ),

            // Phần còn lại cuộn được
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: AutoImageSlider(onTap: (index){Navigator.push(context, MaterialPageRoute(builder: (_) => MainTabPage()));} )),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: FontsApp.title(color: ColorsApp.terra, fontSize: 17),
                          ),
                          SizedBox(height: 10,),
                          CategoriesList(),
                          SizedBox(height: 10),
                          Text(
                            'Best Seller',
                            style: FontsApp.title(color: ColorsApp.terra, fontSize: 17),
                          ),
                          SizedBox(height: 10),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              BestSellCard(text: 'Kitchen Cart'),
                              Positioned(
                                right: 0,
                                top: -50,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/images/collection1.png',
                                  width: 170,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        'New Collection',
                        style: FontsApp.title(color: ColorsApp.terra, fontSize: 17),
                      ),
                    ),
                  ),
                  // ProductGrid cuộn trong Sliver
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          final product = demoProducts[index];
                          return GestureDetector(
                            onTap: () {
                              print('Clicked product: ${product.title}');
                            },
                            child: ProductCard(
                              product: product,
                              onFavorite: () {
                                favorite(context, product);
                                print('Favorite product: ${product.title}');
                              },
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
                              },
                            ),
                          );
                        },
                        childCount: demoProducts.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
