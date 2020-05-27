import 'package:flutter/material.dart';
import 'package:rich_alert/rich_alert.dart';

class CallAlert {
  static void show(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            alertTitle: richTitle("Pronto!!"),
            alertSubtitle: Text(
              "Seu pedido já pode ser retirado no balcão\n😁",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            alertType: RichAlertType.SUCCESS,
            actions: <Widget>[
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  elevation: 2.0,
                  color: Colors.green,
                  child: Text(
                    "Ok, vou buscar!!!",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}
