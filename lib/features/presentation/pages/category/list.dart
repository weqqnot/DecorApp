import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/models/category.dart';
import '../../../navigator/tabbar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Category> categories = [
    Category(
        id: 1,
        name: 'Decorative Light',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 4)),
    Category(
        id: 2,
        name: 'Bedroom',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 1)),
    Category(
        id: 3,
        name: 'Living Room',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 2)),
    Category(
        id: 4,
        name: 'Tables',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 2)),
    Category(
        id: 5,
        name: 'Chairs',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 2)),
    Category(
        id: 6,
        name: 'Cupboard',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 3)),
    Category(
        id: 7,
        name: 'Decor',
        iconPath: '',
        destinationPage: MainTabPage(initialIndex: 4)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Categories",
              style: FontsApp.title(color: ColorsApp.terra))),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => category.destinationPage),
                );
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorsApp.terra.withOpacity(0.5),
                    ),
                  ),
                  Center(
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: FontsApp.subTitle(color: ColorsApp.white).copyWith(
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
