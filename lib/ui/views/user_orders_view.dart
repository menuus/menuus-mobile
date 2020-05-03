import 'package:flutter/cupertino.dart';
import 'package:menuus_mobile/services/http_service.dart';

class UserOrdersView extends StatefulWidget {
  @override
  _UserOrdersViewState createState() => _UserOrdersViewState();
}

class _UserOrdersViewState extends State<UserOrdersView> {
  @override
  void initState() {
    super.initState();
    getFoodCourts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('user orders view'),
    );
  }
}
