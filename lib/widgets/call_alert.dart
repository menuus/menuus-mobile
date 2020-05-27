import 'package:flutter/material.dart';
import 'package:rich_alert/rich_alert.dart';

class Alert {
  static Map<int, Color> _typeColor = {
    RichAlertType.ERROR: Colors.red,
    RichAlertType.SUCCESS: Colors.green,
    RichAlertType.WARNING: Colors.blue,
  };

  static void show(
    BuildContext context,
    int alertType,
    String title,
    String message,
    String buttonLabel,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            alertTitle: richTitle(title),
            alertSubtitle: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            alertType: alertType,
            actions: <Widget>[
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  elevation: 2.0,
                  color: _typeColor[alertType],
                  child: Text(
                    buttonLabel,
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

  static void orderFinished(BuildContext context) {
    show(
      context,
      RichAlertType.SUCCESS,
      "Pronto!!",
      "Seu pedido já pode ser retirado no balcão\n😁",
      "Ok, vou buscar!!!",
    );
  }

  static void error(BuildContext context, String message) {
    show(context, RichAlertType.ERROR, "Erro", message, "Ok");
  }
}
