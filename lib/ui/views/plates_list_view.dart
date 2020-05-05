import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menuus_mobile/services/http_service.dart';

class PlatesListView extends StatefulWidget {
  @override
  _PlatesListViewState createState() => _PlatesListViewState();
}

class _PlatesListViewState extends State<PlatesListView> {
  double _gridItemWidth;

  Future plates$;

  @override
  void initState() {
    super.initState();
    plates$ = getPlates();
  }

  @override
  Widget build(BuildContext context) {
    _gridItemWidth = MediaQuery.of(context).size.width / 3 - 3;

    return FutureBuilder(
      future: plates$,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ListView(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                Text('filtro1'),
                Text('filtro2'),
                Text('filtro3'),
              ]),
              Center(
                child: Wrap(
                  runSpacing: 2,
                  spacing: 2,
                  children: buildContainer(snapshot.data),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> buildContainer(List plates) {
    List<Widget> list = [];
    for (var plate in plates) {
      list.add(
        Container(
          height: _gridItemWidth,
          width: _gridItemWidth,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://picsum.photos/200/300?random=${plate['id']}'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(plate['name']),
              Text(plate['images'] != null && plate['images'].length > 0 
                  ? plate['images'][0]['path']  
                  : 'NO-URL'),
            ],
          ),
        ),
      );
    }
    for (var i = 0; i < plates.length; i++) {}
    return list;
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
            height: 200,
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
      width: 200,
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
