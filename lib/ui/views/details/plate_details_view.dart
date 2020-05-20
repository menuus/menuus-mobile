import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

class PlateDetailsView extends StatefulWidget {
  final Plate plate;

  PlateDetailsView(this.plate);

  @override
  _PlateDetailsViewState createState() => _PlateDetailsViewState(plate);
}

class _PlateDetailsViewState extends State<PlateDetailsView> {
  Plate plate;
  Future<Plate> plate$;

  final cart = GetIt.I.get<CartController>();

  _PlateDetailsViewState(this.plate);

  @override
  void initState() {
    super.initState();
    plate$ = getPlateDetails(plate.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plate.name),
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
                  Text('id: ${snapshot.data.id}'),
                  Text('establishment_id: ${snapshot.data.establishmentId}'),
                  Text('plate_category_id: ${snapshot.data.plateCategoryId}'),
                  Text('name: ${snapshot.data.name}'),
                  Text('description: ${snapshot.data.description}'),
                  Text('price: ${snapshot.data.price}'),
                  Text('created_at: ${snapshot.data.createdAt}'),
                  Text('updated_at: ${snapshot.data.updatedAt}'),
                  Text('images: ${snapshot.data.images.length}'),
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text('Adicionar ao carrinho'),
                    onPressed: () {
                      cart.addToCart(plate);
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
