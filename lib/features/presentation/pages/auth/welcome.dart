import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:decor_home_app/features/presentation/pages/auth/log_in.dart';
import 'package:decor_home_app/features/presentation/pages/auth/register.dart';
import 'package:decor_home_app/features/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/vectors/Vector-w.svg'),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: 'HOME \n',
                  style: FontsApp.title(color: ColorsApp.salmon, fontSize: 58),
                ),
                TextSpan(
                  text: 'DECOR \n',
                  style: TextStyle(
                      color: ColorsApp.salmon,
                      letterSpacing: 10.0,
                      fontSize: 35,
                      height: 0.8),
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Chào mừng bạn đến với Home Decor',
              style: FontsApp.subText(color: ColorsApp.dark),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'Đăng ký',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                print('Đăng ký');
              },
              color: ColorsApp.salmon,
            ),
            SizedBox(height: 10),
            CustomButton(
              text: 'Đăng nhập',
              onPressed: () {
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInPage()));
                }

                print('Đăng nhập');
              },
              color: ColorsApp.beige,
            ),
          ],
        ),
      ),
    );
  }
}
