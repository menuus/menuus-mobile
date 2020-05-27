import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/controllers/category_controller.dart';
import 'package:menuus_mobile/controllers/credit_card_controller.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/ui/views/checkout_view.dart';
import 'package:menuus_mobile/ui/views/login_view.dart';
import 'package:menuus_mobile/ui/views/menu_listing_view.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CartController>(CartController());
  getIt.registerSingleton<CreditCardController>(CreditCardController());
  getIt.registerSingleton<UserController>(UserController());
  getIt.registerSingleton<CategoryController>(CategoryController());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/menu-listing': (context) => MenuListingView(),
        '/checkout': (context) => CheckoutView(),
      },
    );
  }
}
