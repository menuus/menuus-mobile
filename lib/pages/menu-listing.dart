import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/food_model.dart';
import 'package:menuus_mobile/widgets/food_card.dart';

class MenuListing extends StatefulWidget {
  @override
  _MenuListingState createState() => _MenuListingState();
}

class _MenuListingState extends State<MenuListing> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    RestaurantListing(),
    AnimatedContainer(color: Colors.blue, duration: Duration(milliseconds: 300)),
    AnimatedContainer(color: Colors.red, duration: Duration(milliseconds: 300)),
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
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), title: Text('Teste')),
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

// ----------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------

class RestaurantListing extends StatefulWidget {
  const RestaurantListing({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantListingState createState() => _RestaurantListingState();
}

class _RestaurantListingState extends State<RestaurantListing> {
  List<Food> initialFoodList = []
    ..add(Food('comidinha', 'restaurante', 'quasi architecto beatae vitae'))
    ..add(Food('comidao', 'lanchonete', 'accusantium doloremque laudantium'))
    ..add(Food('burguinho', 'foodtruck', 'aut fugit, sed quia'))
    ..add(Food('burgao', 'sorveteria', 'veniam, quis nostrum'))
    ..add(Food('cachaça', 'boteco', 'modi tempora incidunt'));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView.builder(
          itemCount: initialFoodList.length,
          itemBuilder: (context, int) {
            return FoodCard(initialFoodList[int]);
          },
        ),
      ),
    );
  }
}
