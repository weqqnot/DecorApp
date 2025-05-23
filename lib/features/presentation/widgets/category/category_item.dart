import 'package:decor_home_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category.dart';
import '../../../navigator/tabbar.dart';


class CategoryItem extends StatelessWidget {

  final String? label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryItem({super.key, this.label, required this.iconPath, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? ColorsApp.rosy : ColorsApp.beige,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(iconPath, width: 32, height: 32),
      ),
    );
  }
}

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  int? selectedCategoryId;

  final List<Category> categories = [
    Category(id: 1, name: 'Living Room', iconPath: 'assets/vectors/sofa.png',destinationPage: MainTabPage(initialIndex: 2)),
    Category(id: 2, name: 'Bedroom', iconPath: 'assets/vectors/lounge_sofa.png',destinationPage: MainTabPage(initialIndex: 1)),
    Category(id: 3, name: 'Kitchen', iconPath: 'assets/vectors/table_chair.png', destinationPage: MainTabPage(initialIndex: 4)),
    Category(id: 4, name: 'Kitchen', iconPath: 'assets/vectors/kitchen.png', destinationPage: MainTabPage(initialIndex: 3)),
    Category(id: 5, name: 'Living Room', iconPath: 'assets/vectors/sofa.png',destinationPage: MainTabPage(initialIndex: 2)),

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return CategoryItem(
            label: category.name,
            iconPath: category.iconPath,
            isSelected: selectedCategoryId == category.id,
            onTap: () {
              setState(() {
                selectedCategoryId = category.id;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => category.destinationPage),
              );
              print('Selected: ${category.name}');
            },
          );
        }).toList(),
      ),
    );
  }}
