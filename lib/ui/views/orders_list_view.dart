import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:menuus_mobile/models/orders_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

class OrdersListView extends StatefulWidget {
  @override
  _OrdersListViewState createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  Future<List<Order>> orders$;

  Future onRefresh() async {
    setState(() {
      orders$ = getOrders();
    });
  }

  @override
  void initState() {
    super.initState();
    orders$ = getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: orders$,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildOrderItem(snapshot.data[index]);
                    },
                  ),
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildOrderItem(Order order) {
    List<String> list = [];
    for (var i = 0; i < order.plates.length; i++) {
      list.add(order.plates[i].name);
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(4),
        child: ListTile(
          title: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: order.plates.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(order.plates[index].name);
            },
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Pedido'),
              Text(order.id.toString()),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Criado em ${Jiffy(order.createdAt).format("dd/MM/yyyy - HH:mm") }'),
              Text('Última atualização: ${DateTime.now().difference(order.updatedAt).inMinutes} minutos atrás'),
            ],
          ),
        ),
      ),
    );
  }
}
