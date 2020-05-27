import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/cart_controller.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/ui/views/establishments_list_view.dart';
import 'package:menuus_mobile/ui/views/orders_list_view.dart';
import 'package:menuus_mobile/ui/views/plates_list_view.dart';
import 'package:menuus_mobile/utils/layout_utils.dart';
import 'package:menuus_mobile/widgets/bottom_menu_bar.dart';
import 'package:menuus_mobile/widgets/floating_dial_button.dart';

class MenuListingView extends StatefulWidget {
  @override
  _MenuListingViewState createState() => _MenuListingViewState();
}

class _MenuListingViewState extends State<MenuListingView> {
  int _selectedTabIndex = 0;
  String _appBarTitle = 'Todas as categorias';
  List<Widget> _tabRoutingList = [
    EstablishmentsListView(),
    PlatesListView(),
    OrdersListView(),
  ];
  List<BottomMenuBarItem> _tabItemsList = [
    BottomMenuBarItem(iconData: Icons.restaurant, text: 'Restaurantes'),
    BottomMenuBarItem(iconData: Icons.restaurant_menu, text: 'Pratos'),
    BottomMenuBarItem(iconData: Icons.person, text: 'Pedidos'),
  ];

  final cart = GetIt.I.get<CartController>();
  final user = GetIt.I.get<UserController>();

  void _onFloatingCategorySelection(int index) {
    setState(() {
      _appBarTitle = 'Categorias de index $index';
    });
  }

  void _onTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
      _appBarTitle = index == 2 ? user.userData.user.name : 'Todas as categorias';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
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
      backgroundColor: Colors.grey[200],
      body: _tabRoutingList[_selectedTabIndex],
      extendBody: true,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _buildFab(context),
      bottomNavigationBar: BottomMenuBar(
        // centerItemText: 'Cardápios',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onTabSelection,
        items: _tabItemsList,
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.fastfood, Icons.ac_unit, Icons.local_bar];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FloatingDialButton(
            icons: icons,
            onIconTapped: _onFloatingCategorySelection,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
