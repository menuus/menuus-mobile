import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';

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
          Observer(
            builder: (_) => Flexible(
              child: ListView.builder(
                itemCount: cart.cartPlates.length,
                itemBuilder: (_, index) {
                  final plate = cart.cartPlates[index];
                  return Observer(
                    builder: (_) => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading, 
                      value: true,
                      onChanged: (flag) => {},
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            plate,
                            overflow: TextOverflow.ellipsis,
                          )),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => cart.removeFromCart(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
