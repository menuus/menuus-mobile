import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/controllers/credit_card_controller.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/models/credit_card_model.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({Key key}) : super(key: key);

  final cart = GetIt.I.get<CartController>();
  final cards = GetIt.I.get<CreditCardController>();
  final user = GetIt.I.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text('${cart.total.toString()} itens no carrinho');
        }),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text('Itens', style: Theme.of(context).textTheme.headline6),
                ),
                Observer(builder: (_) {
                  return ListBody(children: itemsList());
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Text('Forma de pagamento', style: Theme.of(context).textTheme.headline6),
                ),
                Container(
                  height: 215,
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cards.total,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 23),
                            child: buildCreditCard(cards.creditCards[index], context));
                      },
                    );
                  }),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: Text('Detalhes do pedido', style: Theme.of(context).textTheme.headline6)),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: buildOrderDetails(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                  child: RaisedButton(
                    child: Text('Finalizar pedido'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      postOrder();
                    },
                  ),
                ),
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: buildCartTile(cart.cartPlates[i], i),
        ),
      );
    }
    return list;
  }

  Material buildCartTile(Plate plate, int index) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(4),
      child: ListTile(
        leading: Image(
          image: NetworkImage('https://picsum.photos/200/300?random=${plate.id}'),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(plate.name, overflow: TextOverflow.ellipsis),
        subtitle: Text('R\$ ${plate.price.toString()}'),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => cart.removeFromCart(index)),
      ),
    );
  }

  Widget buildCreditCard(CreditCard card, BuildContext context) {
    TextStyle caption = Theme.of(context).textTheme.caption;
    TextStyle data = Theme.of(context).textTheme.bodyText1;

    return Container(
      width: 320,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 25, 5, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Nome impresso no cartão', style: caption),
                      Text(card.name, style: data),
                      SizedBox(height: 20),
                      Text('Número do cartão', style: caption),
                      Text(card.number.toString(), style: data),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Expiração', style: caption),
                      Text(card.expiration, style: data),
                      SizedBox(height: 20),
                      Text('Código', style: caption),
                      Text(card.cvc.toString(), style: data),
                    ],
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Editar dados'),
                textColor: Colors.blue[600],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderDetails() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('pedido 1'),
              Divider(),
              Text('pedido 2'),
              Divider(),
              Text('pedido 3'),
              Divider(),
              Text('Observações'),
              Divider(),
              Text('Total: ${cart.totalPrice}'),
            ],
          );
        }),
      ),
    );
  }
}
