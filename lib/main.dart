import 'package:flutter/material.dart';
import 'package:menuus_mobile/ui/views/plates_list_view.dart';
import 'package:menuus_mobile/ui/views/restaurants_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: WelcomeScreen(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => WelcomeScreen(),
        '/establishments': (context) => RestaurantListView(),
        '/plates': (context) => PlatesListView(),
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
            Navigator.pushNamed(context, '/establishments');
          },
        ),
      ),
    );
  }
}
