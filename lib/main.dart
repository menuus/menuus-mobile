import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/pages/menu-listing.dart';
import 'package:menuus_mobile/ui/views/checkout_view.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CartController>(CartController());
  
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
        '/login': (context) => WelcomeScreen(),
        '/menu-listing': (context) => MenuListing(),
        '/checkout': (context) => CheckoutView(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('() => onLogin'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/menu-listing');
          },
        ),
      ),
    );
  }
}
