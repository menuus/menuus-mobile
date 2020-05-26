import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/services/http_service.dart';
import 'package:menuus_mobile/ui/views/details/plate_details_view.dart';

class EstablishmentDetailsView extends StatefulWidget {
  final Establishment establishment;

  EstablishmentDetailsView(this.establishment, {Key key}) : super(key: key);

  @override
  _EstablishmentDetailsViewState createState() => _EstablishmentDetailsViewState();
}

class _EstablishmentDetailsViewState extends State<EstablishmentDetailsView> {
  final cart = GetIt.I.get<CartController>();
  Future<List<Plate>> plates$;

  @override
  void initState() {
    super.initState();
    plates$ = getPlates(establishmentId: widget.establishment.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.establishment.name),
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
          Text(
            widget.establishment.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Categoria: ${widget.establishment.establishmentCategoryId}   Praça: ${widget.establishment.foodCourtId}',
          ),
          SizedBox(height: 30),
          Text(
            widget.establishment.description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 30),
          Text(
            'Confira todos os ${widget.establishment.plates.length} pratos:',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          platesList(context),
        ],
      ),
    );
  }

  Widget platesList(context) {
    return FutureBuilder(
      future: plates$,
      builder: (BuildContext context, AsyncSnapshot<List<Plate>> snapshot) {
        if (snapshot.data != null) {
          return Center(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Plate plate = snapshot.data[index];
                return Padding(
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
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> platesListOld(context) {
    List<Widget> list = [];
    for (var i = 0; i < widget.establishment.plates.length; i++) {
      Plate plate = widget.establishment.plates[i];
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
