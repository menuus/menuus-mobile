import 'package:flutter/material.dart';
import 'package:menuus_mobile/ui/views/plates_list_view.dart';
import 'package:menuus_mobile/ui/views/restaurants_list_view.dart';
import 'package:menuus_mobile/ui/views/user_orders_view.dart';

class MenuListing extends StatefulWidget {
  @override
  _MenuListingState createState() => _MenuListingState();
}

class _MenuListingState extends State<MenuListing> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    RestaurantListView(),
    PlatesListView(),
    UserOrdersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), title: Text('Restaurantes')),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), title: Text('Pratos')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Meus pedidos')),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
