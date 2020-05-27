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
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: plate$,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Plate plate = snapshot.data;
            return ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(plate.establishment.name, style: Theme.of(context).textTheme.caption),
                        Text(plate.name, style: Theme.of(context).textTheme.headline5),
                        SizedBox(height: 10),
                        Text('R\$ ${plate.price}', style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    Hero(
                      tag: plate.slug,
                      child: Image(
                        image: NetworkImage(plate.images[0].path),
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text('Categorias: ${plate.plateCategory.name}', style: Theme.of(context).textTheme.caption),
                SizedBox(height: 5),
                Text('Descrição: ${plate.description}', style: Theme.of(context).textTheme.caption),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Adicionar ao carrinho'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    cart.addToCart(plate);
                  },
                ),
                SizedBox(height: 20),
                Text('Imagens:', style: Theme.of(context).textTheme.caption),
                buildImageList(plate.images),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildImageList(List<PlateImage> images) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        PlateImage image = images[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Image(
            image: NetworkImage(image.path),
            width: 50,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
