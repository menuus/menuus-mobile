import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/ui/views/details/plate_details_view.dart';

class EstablishmentDetailsView extends StatelessWidget {
  final cart = GetIt.I.get<CartController>();
  final Establishment establishment;

  EstablishmentDetailsView(this.establishment, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(establishment.name),
        actions: <Widget>[
          Center(child: Observer(builder: (_) {
            return Text(cart.total.toString());
          })),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              }),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Text(establishment.name, style: Theme.of(context).textTheme.headline5),
          Text('Categoria: ${establishment.establishmentCategoryId}   Praça: ${establishment.foodCourtId}'),
          SizedBox(height: 30),
          Text(establishment.description, style: Theme.of(context).textTheme.subtitle1),
          SizedBox(height: 30),
          Text('Veja todos os ${establishment.plates.length} pratos:', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 10),
          ListBody(children: platesList(context)),
        ],
      ),
    );
  }

  List<Widget> platesList(context) {
    List<Widget> list = [];
    for (var i = 0; i < establishment.plates.length; i++) {
      Plate plate = establishment.plates[i];
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(4),
            child: ListTile(
              dense: true,
              leading: Image(
                image: NetworkImage(plate.images != null ? plate.images[0].path : ''),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(plate.name, overflow: TextOverflow.ellipsis),
              subtitle: Text(plate.description),
              trailing: Text('R\$ ${plate.price}'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlateDetailsView(plate)));
              },
            ),
          ),
        ),
      );
    }
    return list;
  }
}
