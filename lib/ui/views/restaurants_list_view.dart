import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

import 'details/establishment_details_view.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  double _restaurantMenuHeight = 500;
  double _restaurantMenuWidth = 400;
  Future<List<Establishment>> establishments$;

  final cart = GetIt.I.get<CartController>();

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

  CarouselSlider _buildCarouselSlider(List<Establishment> establishments) {
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

  Container _restaurantMenu(Establishment establishment) {
    return Container(
      width: _restaurantMenuWidth,
      padding: EdgeInsets.fromLTRB(5, 5, 5, 75),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        type: MaterialType.card,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EstablishmentDetailsView(establishment)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('id: ${establishment.id}'),
                  Text('food_court_id: ${establishment.foodCourtId.toString()}'),
                  Text('establishment_category_id: ${establishment.establishmentCategoryId.toString()}'),
                  Text('name: ${establishment.name}'),
                  Text('description: ${establishment.description}'),
                  Text('plates: ${establishment.plates.length}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
