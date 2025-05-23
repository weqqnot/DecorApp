import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:decor_home_app/features/presentation/pages/auth/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: ColorsApp.terra,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/vectors/Vector.svg'),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: 'HOME \n',
                  style: FontsApp.title(color: ColorsApp.beige, fontSize: 58),
                ),
                TextSpan(
                  text: 'DECOR',
                  style: TextStyle(
                      color: ColorsApp.white,
                      letterSpacing: 10.0,
                      fontSize: 35,
                      height: 0.8),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
