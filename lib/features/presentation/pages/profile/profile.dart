import 'dart:convert';

import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/features/presentation/pages/favorite/wishlist.dart';
import 'package:decor_home_app/features/presentation/pages/profile/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {



  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: FontsApp.title(color: ColorsApp.terra)),
        backgroundColor: ColorsApp.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset('assets/vectors/Bot-Edit.png'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg')
            ),
            SizedBox(height: 10),
            Text('Nguyễn Trang', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('ID: 57648484', style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ProfileButton(
                    icon: Image.asset('assets/vectors/Profile.png', color: ColorsApp.orangeDark,),
                    label: 'Profile',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage()));
                    },
                  ),
                  _ProfileButton(
                    icon: Image.asset('assets/vectors/Wishlist.png', color: ColorsApp.orangeDark,),
                    label: 'Wishlist',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
                    },
                  ),
                  // _ProfileButton(
                  //   icon: Icons.shopping_bag,
                  //   label: 'My Orders',
                  //   onTap: () {
                  //     // Gắn logic sau
                  //   },
                  // ),
                ],
              ),
            ),

            SizedBox(height: 30),
            _SettingTile(icon: Icons.privacy_tip, title: 'Privacy Policy'),
            _SettingTile(icon: Icons.payment, title: 'Payment Methods'),
            _SettingTile(icon: Icons.notifications, title: 'Notification'),
            _SettingTile(icon: Icons.settings, title: 'Settings'),
            _SettingTile(icon: Icons.help_outline, title: 'Help'),
            _SettingTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => logout(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  final Image icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorsApp.salmon,
            child: icon,
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _SettingTile({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorsApp.terra),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
