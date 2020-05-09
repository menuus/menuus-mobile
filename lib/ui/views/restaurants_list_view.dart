import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menuus_mobile/services/http_service.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  double _restaurantMenuHeight = 400;
  double _restaurantMenuWidth = 300;
  Future establishments$;

  @override
  void initState() {
    super.initState();
    establishments$ = getEstablishments();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
          future: establishments$,
          builder: (context, snapshot) {
            return snapshot.data != null ? _buildCarouselSlider(snapshot.data) : CircularProgressIndicator();
          },
      ),
    );
  }

  CarouselSlider _buildCarouselSlider(establishments) {
    return CarouselSlider.builder(
      itemCount: establishments.length,
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        height: _restaurantMenuHeight,
        viewportFraction: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _restaurantMenu(establishments[index]);
      },
    );
  }

  Container _restaurantMenu(establishment) {
    return Container(
      width: _restaurantMenuWidth,
      color: Colors.red,
      child: Center(
        child: Text('name: ${establishment['name']}\ndescription: ${establishment['description']}\n'),
      ),
    );
  }
}
