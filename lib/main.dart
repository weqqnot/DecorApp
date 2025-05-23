import 'package:decor_home_app/core/theme/theme.dart';
import 'package:decor_home_app/features/navigator/bottom_bar.dart';
import 'package:decor_home_app/features/presentation/pages/splash/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/data/repositories/auth_repository.dart';
import 'features/domain/repositories/favorite_repository.dart';
import 'features/presentation/bloc/auth_cubit.dart';
import 'features/presentation/bloc/favorite_cubit.dart';
import 'features/presentation/pages/auth/log_in.dart';
import 'features/presentation/pages/home/home.dart';


void main() {
  final authRepository = AuthRepository(baseUrl: 'http://localhost:8080/auth');
  final favoriteRepository = FavoriteRepository();
  runApp(
      // MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (_) => AuthCubit(authRepository),
      //           ),
      //           BlocProvider(
      //             create: (_) => FavoriteCubit(favoriteRepository),
      //           ),
      //         ],
      //         child: const MyApp(),
      //       ),
      //     );

    DevicePreview(
      enabled: true,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(authRepository),
          ),
          BlocProvider(
            create: (_) => FavoriteCubit(favoriteRepository),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decor Home ',
      debugShowMaterialGrid: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme, 
      darkTheme: ThemeApp.darkTheme,
      initialRoute: '/',
      // routes: {
      //   '/': (context) =>  SplashPage(),  // Splash page khởi đầu
      //   '/login': (context) =>  LogInPage(),  // Login page
      //   '/home': (context) =>  BottomTabbar(),  // Home page
      // },
      home: BottomTabbar(),
    );
  }
}

