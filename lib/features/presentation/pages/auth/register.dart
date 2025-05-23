import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:decor_home_app/features/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/user_dto.dart';
import '../../bloc/auth_cubit.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;

  void onPressed () {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final birthday = _birthdayController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mật khẩu không khớp')),
      );
      return;
    }

    context.read<AuthCubit>().register(
          UserDto(
            fullName: fullName,
            email: email,
            phone: phone,
            birthday: birthday,
            password: password,
          ),
        );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tạo tài khoản',
          style: FontsApp.title(color: ColorsApp.terra),
        ),
      ),
      body:
      BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthLoading) {
        showDialog(
          context: context,
          builder: (_) => Center(child: CircularProgressIndicator()),
        );
      } else if (state is AuthSuccess) {
        Navigator.pop(context); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đăng ký thành công!')),
        );
        Navigator.pop(context); // Quay về login hoặc home
      } else if (state is AuthError) {
        Navigator.pop(context); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: ${state.message}')),
        );
      }
    },
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Họ Tên',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                      hintText: 'Họ Tên',
                      filled: true,
                      fillColor: ColorsApp.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: FontsApp.subText(color: ColorsApp.rosy)),
                  keyboardType: TextInputType.name,
                )
              ],
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'example@example.com',
                      filled: true,
                      fillColor: ColorsApp.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: FontsApp.subText(color: ColorsApp.rosy)),
                  keyboardType: TextInputType.emailAddress,
                )
              ],
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Số điện thoại',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      hintText: '+ 123 456 789',
                      filled: true,
                      fillColor: ColorsApp.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: FontsApp.subText(color: ColorsApp.rosy)),
                  keyboardType: TextInputType.phone,
                )
              ],
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ngày Sinh',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _birthdayController,
                  decoration: InputDecoration(
                      hintText: 'DD / MM / YYYY',
                      filled: true,
                      fillColor: ColorsApp.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: FontsApp.subText(color: ColorsApp.rosy)),
                  keyboardType: TextInputType.datetime,
                )
              ],
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mật Khẩu',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    filled: true,
                    fillColor: ColorsApp.beige,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                )
              ],
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xác Nhận Mật Khẩu',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 16),
                ),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    filled: true,
                    fillColor: ColorsApp.beige,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                )
              ],
            )),
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Bằng cách tạo tài khoản, bạn đồng ý với \n',
                style: FontsApp.subText(color: ColorsApp.dark, fontSize: 14),
              ),
              TextSpan(
                  text: 'Điều khoản dịch vụ',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 14)),
              TextSpan(
                text: ' và ',
                style: FontsApp.subText(color: ColorsApp.dark, fontSize: 14),
              ),
              TextSpan(
                  text: 'Chính sách bảo mật',
                  style: FontsApp.title(color: ColorsApp.dark, fontSize: 14)),
            ])),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                text: 'Đăng ký',
                onPressed: () {
                  onPressed();
                },
                color: ColorsApp.salmon),
            SizedBox(
              height: 10,
            ),
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
                  )
                ]))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
