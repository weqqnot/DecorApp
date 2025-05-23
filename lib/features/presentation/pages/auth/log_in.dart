import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:decor_home_app/features/presentation/pages/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import '../../../data/repositories/auth_service.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TapGestureRecognizer _registerTapRecognizer;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập email và mật khẩu')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final success = await AuthService.login(email, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sai email hoặc mật khẩu')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _registerTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())); 
      };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng nhập',
          style: FontsApp.title(color: ColorsApp.terra),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chào mừng bạn 🫶🫶🫶',
              style: FontsApp.subTitle(color: ColorsApp.dark),
            ),
            SizedBox(height: 10),
            Text(
              'Hãy điền thông tin dưới để hoàn thành nhé! 🥰' ,
              style: FontsApp.subText(color: ColorsApp.dark),
            ),

            SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Username Hoặc Email',
                labelStyle: FontsApp.title(
                  color: ColorsApp.terra,
                  fontSize: 16,
                ),
                hintText: 'example@example.com',
                filled: true,
                fillColor: ColorsApp.beige,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintStyle: FontsApp.subText(color: ColorsApp.rosy),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: FontsApp.title(
                  color: ColorsApp.terra,
                  fontSize: 16,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: ColorsApp.beige,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: ColorsApp.rosy,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 30),
            Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.terra,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      onPressed: _handleLogin,
                      child: Text('Đăng nhập', style: FontsApp.title(color: Colors.white, fontSize: 16)),
                    ),
            ),
            SizedBox(height: 70),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'hoặc đăng ký với',
                  style: FontsApp.subText(color: ColorsApp.dark),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/vectors/facebook.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/vectors/google.svg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Bạn chưa có tài khoản?',
                      style: FontsApp.subText(
                        color: ColorsApp.dark,
                        fontSize: 14,
                      )),
                  TextSpan(
                    text: '  Đăng ký',
                    style: FontsApp.subText(color: ColorsApp.terra),
                    recognizer: _registerTapRecognizer,
                  )
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
