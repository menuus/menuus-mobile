import 'package:flutter/material.dart';
import 'package:menuus_mobile/ui/views/plates_list_view.dart';
import 'package:menuus_mobile/ui/views/restaurants_list_view.dart';
import 'package:menuus_mobile/utils/layout_utils.dart';
import 'package:menuus_mobile/widgets/bottom_menu_bar.dart';
import 'package:menuus_mobile/widgets/floating_dial_button.dart';

class MenuListing extends StatefulWidget {
  @override
  _MenuListingState createState() => _MenuListingState();
}

class _MenuListingState extends State<MenuListing> {
  int _selectedTabIndex = 0;
  String _appBarTitle = 'Todas as categorias';
  List<Widget> _tabRoutingList = [
    RestaurantListView(),
    PlatesListView(),
  ];
  List<BottomMenuBarItem> _tabItemsList = [
    BottomMenuBarItem(iconData: Icons.restaurant, text: 'Restaurantes'),
    BottomMenuBarItem(iconData: Icons.restaurant_menu, text: 'Pratos'),
  ];

  void _onFloatingCategorySelection(int index) {
    setState(() {
      _appBarTitle = 'Categorias de index $index';
    });
  }

  void _onTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: _tabRoutingList[_selectedTabIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
      bottomNavigationBar: BottomMenuBar(
        centerItemText: 'Cardápios',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onTabSelection,
        items: _tabItemsList,
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
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
