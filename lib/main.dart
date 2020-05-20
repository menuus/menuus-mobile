import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/controllers/credit_card_controller.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/pages/menu-listing.dart';
import 'package:menuus_mobile/ui/views/checkout_view.dart';
import 'package:menuus_mobile/ui/views/login_view.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CartController>(CartController());
  getIt.registerSingleton<CreditCardController>(CreditCardController());
  getIt.registerSingleton<UserController>(UserController());
  
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
        '/menu-listing': (context) => MenuListing(),
        '/checkout': (context) => CheckoutView(),
      },
    );
  }
}
