import 'package:flutter/material.dart';
import 'package:menuus_mobile/services/http_service.dart';
import 'package:menuus_mobile/widgets/bottom_menu_bar.dart';

class PlatesListView extends StatefulWidget {
  @override
  _PlatesListViewState createState() => _PlatesListViewState();
}

class _PlatesListViewState extends State<PlatesListView> {
  double _gridItemWidth;

  Future plates$;

  @override
  void initState() {
    super.initState();
    plates$ = getPlates();
  }

  @override
  Widget build(BuildContext context) {
    _gridItemWidth = MediaQuery.of(context).size.width / 3 - 3;

    return Scaffold(
      body: FutureBuilder(
        future: plates$,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: <Widget>[
                          CategoryFilterCard('teste1'),
                          CategoryFilterCard('teste2'),
                          CategoryFilterCard('teste3'),
                          CategoryFilterCard('teste4'),
                          CategoryFilterCard('teste5'),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Wrap(
                          runSpacing: 2,
                          spacing: 2,
                          children: buildContainer(snapshot.data),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }

  List<Widget> buildContainer(List plates) {
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
              Text(plate['images'] != null && plate['images'].length > 0 ? plate['images'][0]['path'] : 'NO-URL'),
            ],
          ),
        ),
      );
    }
    for (var i = 0; i < plates.length; i++) {}
    return list;
  }

  Container _plateCategory(String plateCategory, plates) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.maxFinite,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text(plateCategory),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plates.length,
              itemBuilder: (context, index) {
                return _plateCard(plates[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _plateCard(plate) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(10),
      color: Colors.green,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('${plate['name']}'),
            _foodImage(plate['images']),
          ],
        ),
      ),
    );
  }

  Container _foodImage(images) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(images.length > 0 ? images[0]['path'] : ''),
        ),
      ),
    );
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(width: 1.00, color: Color(0xffcccccc)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        category,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff707070)),
      ),
    );
  }
}
