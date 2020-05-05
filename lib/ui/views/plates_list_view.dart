import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menuus_mobile/services/http_service.dart';

class PlatesListView extends StatefulWidget {
  @override
  _PlatesListViewState createState() => _PlatesListViewState();
}

class _PlatesListViewState extends State<PlatesListView> {
  double _plateCardHeight = 120;
  double _plateCardWidth = 300;

  Future plates$;

  @override
  void initState() {
    super.initState();
    plates$ = getPlates();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: plates$,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? ListView(
                  children: <Widget>[
                    _plateCategory('Lanches', snapshot.data),
                    _plateCategory('Massas', snapshot.data),
                    _plateCategory('Bebidas', snapshot.data),
                    _plateCategory('Sobremesas', snapshot.data),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  Container _plateCategory(String plateCategory, plates) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.maxFinite,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text(plateCategory),
          Container(
            height: _plateCardHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plates.length,
              itemBuilder: (context, index) {
                return _plateCard(plates[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _plateCard(plate) {
    return Container(
      width: _plateCardWidth,
      margin: EdgeInsets.all(10),
      color: Colors.green,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('${plate['name']}'),
            _foodImage(plate['images']),
          ],
        ),
      ),
    );
  }

  Container _foodImage(images) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(images.length > 0 ? images[0]['path'] : ''),
        ),
      ),
    );
  }
}
