import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/food_model.dart';
import 'package:menuus_mobile/widgets/food_card.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {

  List<Food> initialFoodList = []
    ..add(Food('comidinha', 'restaurante', 'quasi architecto beatae vitae'))
    ..add(Food('comidao', 'lanchonete', 'accusantium doloremque laudantium'))
    ..add(Food('burguinho', 'foodtruck', 'aut fugit, sed quia'))
    ..add(Food('burgao', 'sorveteria', 'veniam, quis nostrum'))
    ..add(Food('cachaça', 'boteco', 'modi tempora incidunt'));

  double _restaurantMenuHeight = 400;
  double _restaurantMenuWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: 5,
        options: CarouselOptions(
          autoPlay: false,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          height: _restaurantMenuHeight,
          viewportFraction: 0.8,
        ),
        itemBuilder: (context, index) {
          return _restaurantMenu();
        },
      ),
    );
  }

  Container _restaurantMenu() {
    return Container(
      width: _restaurantMenuWidth,
      color: Colors.red,
      child: Center(
        child: Text('cardapio restaurante'),
      ),
    );
  }

  Container _oldDogsList() {
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
