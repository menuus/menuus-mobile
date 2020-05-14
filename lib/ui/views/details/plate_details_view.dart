import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/services/http_service.dart';

class PlateDetailsView extends StatefulWidget {
  final plate;

  PlateDetailsView(this.plate);

  @override
  _PlateDetailsViewState createState() => _PlateDetailsViewState(plate);
}

class _PlateDetailsViewState extends State<PlateDetailsView> {
  var plate;
  Future plate$;

  final cart = GetIt.I.get<CartController>();

  _PlateDetailsViewState(this.plate);

  @override
  void initState() {
    super.initState();
    plate$ = getPlateDetails(plate['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plate['name']),
        actions: <Widget>[
          Center(
            child: Observer(builder: (_) {
              return Text(cart.total.toString());
            }),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
          ),
        ],
      ),
      floatingActionButton: null,
      body: FutureBuilder(
        future: plate$,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('id: ${plate['id']}'),
                  Text('establishment_id: ${plate['establishment_id']}'),
                  Text('plate_category_id: ${plate['plate_category_id']}'),
                  Text('name: ${plate['name']}'),
                  Text('description: ${plate['description']}'),
                  Text('price: ${plate['price']}'),
                  Text('created_at: ${plate['created_at']}'),
                  Text('updated_at: ${plate['updated_at']}'),
                  Text('images: ${plate['images'].length}'),
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text('Adicionar ao carrinho'),
                    onPressed: () {
                      cart.addToCart(plate['name']);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
