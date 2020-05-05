import 'package:flutter/material.dart';
import 'package:menuus_mobile/pages/menu-listing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: WelcomeScreen(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuListing()));
          },
        ),
      ),
    );
  }
}
