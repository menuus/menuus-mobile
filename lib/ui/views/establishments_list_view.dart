import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

import 'details/establishment_details_view.dart';

class EstablishmentsListView extends StatefulWidget {
  const EstablishmentsListView({
    Key key,
  }) : super(key: key);

  @override
  _EstablishmentsListViewState createState() => _EstablishmentsListViewState();
}

class _EstablishmentsListViewState extends State<EstablishmentsListView> {
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
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        type: MaterialType.card,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EstablishmentDetailsView(establishment)));
          },
          child: Stack(
            children: <Widget>[
              Image(
                image: NetworkImage(establishment.logo.path),
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.7),
                    child: _buildContent(establishment),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Establishment establishment) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Hero(
              tag: establishment.slug,
              child: Image(
                image: NetworkImage(establishment.logo.path),
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'categoria ${establishment.establishmentCategoryId.toString()}',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              '${establishment.description}',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              'Clique para ver todos os ${establishment.platesCount} pratos disponíveis!',
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
    );
  }
}
