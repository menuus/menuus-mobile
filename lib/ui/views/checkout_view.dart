import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/models/plate_model.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({Key key}) : super(key: key);

  final cart = GetIt.I.get<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text('${cart.total.toString()} itens no carrinho');
        }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Text('Itens', ),
                Observer(builder: (_) {
                  return ListBody(children: itemsList());
                }),
                Text('Detalhes do pagamento'),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> itemsList() {
    List<Widget> list = [];
    for (var i = 0; i < cart.total; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: buildCartTile(cart.cartPlates[i], i),
        ),
      );
    }
    return list;
  }

  Material buildCartTile(Plate plate, int index) {
    return Material(
      elevation: 3,
      child: ListTile(
        leading: Image(
          image: NetworkImage('https://picsum.photos/200/300?random=${plate.id}'),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(plate.name, overflow: TextOverflow.ellipsis),
        subtitle: Text(plate.price),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => cart.removeFromCart(index)),
      ),
    );
  }
}
