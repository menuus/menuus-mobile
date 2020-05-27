import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/orders_model.dart';
import 'package:menuus_mobile/services/http_service.dart';

class OrdersListView extends StatefulWidget {
  @override
  _OrdersListViewState createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  Future<List<Order>> orders$;

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
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildOrderItem(snapshot.data[index]);
                  },
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
          title: Text(list.toString()),
          trailing: Text(order.id.toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Criado em ${order.createdAt.toString()}'),
              Text('Atualizado em ${order.updatedAt.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
