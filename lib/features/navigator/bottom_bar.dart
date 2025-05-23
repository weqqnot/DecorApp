import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/features/navigator/tabbar.dart';
import 'package:decor_home_app/features/presentation/pages/category/bedroom.dart';
import 'package:decor_home_app/features/presentation/pages/category/decor_light.dart';
import 'package:decor_home_app/features/presentation/pages/category/list.dart';
import 'package:decor_home_app/features/presentation/pages/favorite/wishlist.dart';
import 'package:decor_home_app/features/presentation/pages/home/home.dart';
import 'package:decor_home_app/features/presentation/pages/home/special_offer.dart';
import 'package:decor_home_app/features/presentation/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({super.key});

  @override
  State<BottomTabbar> createState() => _BottomTabbarState();
}

class _BottomTabbarState extends State<BottomTabbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: ColorsApp.white,
          selectedItemColor: ColorsApp.orangeDark,
          unselectedItemColor: ColorsApp.salmon,
          selectedLabelStyle: TextStyle(
            color: ColorsApp.orangeDark,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/vectors/home.png')), label: 'Home'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/vectors/Categories.png')), label: 'Category'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/vectors/Wishlist.png')), label:'Wishlist'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/vectors/Profile.png')), label: 'Profile'),
          ]),
    );
  }
}

