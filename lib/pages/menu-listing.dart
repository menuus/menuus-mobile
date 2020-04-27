import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/food_model.dart';
import 'package:menuus_mobile/widgets/food_card.dart';

class MenuListing extends StatefulWidget {
  @override
  _MenuListingState createState() => _MenuListingState();
}

class _MenuListingState extends State<MenuListing> {
  List<Food> initialFoodList = []
    ..add(Food('comidinha', 'restaurante', 'quasi architecto beatae vitae'))
    ..add(Food('comidao', 'lanchonete', 'accusantium doloremque laudantium'))
    ..add(Food('burguinho', 'foodtruck', 'aut fugit, sed quia'))
    ..add(Food('burgao', 'sorveteria', 'veniam, quis nostrum'))
    ..add(Food('cachaça', 'boteco', 'modi tempora incidunt'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), title: Text('restaurant')),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), title: Text('restaurant_menu')),
      ]),
      body: Container(
        child: Center(
          child: _buildList(context),
        ),
      ),
    );
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: initialFoodList.length,
      itemBuilder: (context, int) {
        return FoodCard(initialFoodList[int]);
      },
    );
  }
}
