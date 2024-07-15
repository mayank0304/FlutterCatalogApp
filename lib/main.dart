import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/screens/cart_page.dart';
import 'package:catalog_app/screens/home_detail_page.dart';
import 'package:catalog_app/screens/home_page.dart';
import 'package:catalog_app/screens/login_page.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.homeDetailRoute: (context) => const HomeDetailPage(),
        MyRoutes.cartPage: (context) => const CartPage()
      },
    );
  }
}
