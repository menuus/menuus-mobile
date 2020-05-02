import 'package:flutter/material.dart';

class PlatesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _plateRow();
        });
  }

  Container _plateRow() {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.maxFinite,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text('Tipo de prato'),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return _plateCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _plateCard() {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.green,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('nome do prato'),
            Text('foto do prato'),
          ],
        ),
      ),
    );
  }
}
