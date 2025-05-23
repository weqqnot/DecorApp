import 'package:decor_home_app/features/presentation/pages/category/kitchen.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../presentation/pages/category/bedroom.dart';
import '../presentation/pages/category/decor_light.dart';
import '../presentation/pages/category/living_room.dart';
import '../presentation/pages/home/special_offer.dart';

class MainTabPage extends StatefulWidget {
  final int initialIndex;
  const MainTabPage({super.key, this.initialIndex = 0});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _titles = [
    'Special Offer',
    'Bedroom',
    'Living Room',
    'Decorative Light',
    'Auxiliary Furniture'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titles.length, vsync: this, initialIndex: widget.initialIndex,);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {}); // Cập nhật UI khi tab thay đổi
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_tabController.index],
          style: FontsApp.title(color: ColorsApp.terra),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: ColorsApp.orangeDark,
          unselectedLabelColor: Colors.grey,
          indicatorColor: ColorsApp.orangeDark,
          tabs: const [
            Tab(text: 'Special Offer'),
            Tab(text: 'Bedroom'),
            Tab(text: 'Living Room'),
            Tab(text: 'Decorative Light'),
            Tab(text: 'Auxiliary furniturev'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SpecialOfferPage(),
          Bedroom(),
          LivingRoom(),
          DecorLight(),
          Kitchen(),
        ],
      ),
    );
  }
}

