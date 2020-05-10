import 'package:flutter/material.dart';
import 'package:menuus_mobile/services/http_service.dart';

class PlatesListView extends StatefulWidget {
  @override
  _PlatesListViewState createState() => _PlatesListViewState();
}

class _PlatesListViewState extends State<PlatesListView> {
  double _gridItemWidth;
  Future plateCategories$;
  Future plates$;

  @override
  void initState() {
    super.initState();
    plateCategories$ = getPlateCategories();
    plates$ = getPlates();
  }

  @override
  Widget build(BuildContext context) {
    _gridItemWidth = MediaQuery.of(context).size.width / 3 - 3;

    return Column(
      children: <Widget>[
        buildCategoriesRow(),
        buildGrid(),
      ],
    );
  }

  Widget buildCategoriesRow() {
    return Container(
      height: 50,
      child: FutureBuilder(
        future: plateCategories$,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
              return CategoryFilterCard(snapshot.data[index]['name']);
             },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildGrid() {
    return Expanded(
      child: FutureBuilder(
        future: plates$,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView(
              children: <Widget>[
                Center(
                  child: Wrap(
                    runSpacing: 2,
                    spacing: 2,
                    children: buildGridItem(snapshot.data),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> buildGridItem(List plates) {
    List<Widget> list = [];
    for (var plate in plates) {
      list.add(
        Container(
          height: _gridItemWidth,
          width: _gridItemWidth,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://picsum.photos/200/300?random=${plate['id']}'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(plate['name']),
              Text('R\$ ${plate['price']}'),
              Text(plate['images'] != null && plate['images'].length > 0 ? plate['images'][0]['path'] : 'NO-URL'),
            ],
          ),
        ),
      );
    }
    for (var i = 0; i < plates.length; i++) {}
    return list;
  }
}

// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------

class CategoryFilterCard extends StatefulWidget {
  final String category;

  CategoryFilterCard(this.category);

  @override
  _CategoryFilterCardState createState() => _CategoryFilterCardState(category);
}

class _CategoryFilterCardState extends State<CategoryFilterCard> {
  String category;

  _CategoryFilterCardState(this.category);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.00, color: Color(0xffcccccc)),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          category,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff707070)),
        ),
      ),
    );
  }
}
