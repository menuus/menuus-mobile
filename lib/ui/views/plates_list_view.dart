import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/category_controller.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/services/http_service.dart';
import 'package:menuus_mobile/ui/views/details/plate_details_view.dart';

class PlatesListView extends StatefulWidget {
  @override
  _PlatesListViewState createState() => _PlatesListViewState();
}

class _PlatesListViewState extends State<PlatesListView> {
  final catController = GetIt.I.get<CategoryController>();
  double _gridItemWidth;
  Future plateCategories$;
  Future<List<Plate>> plates$;

  @override
  void initState() {
    super.initState();
    plateCategories$ = getPlateCategories();
    plates$ = getPlates();
  }

  @override
  Widget build(BuildContext context) {
    _gridItemWidth = MediaQuery.of(context).size.width / 3 - 2;

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
                return CategoryFilterCard(snapshot.data[index]);
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
        builder: (BuildContext context, AsyncSnapshot<List<Plate>> snapshot) {
          if (snapshot.data != null) {
            return Observer(builder: (_) {
              List<Plate> filtered = [];
              filtered.addAll(snapshot.data);
              if (catController.selectedCategories.length > 0) {
                filtered.removeWhere((plate) => !catController.selectedCategories.contains(plate.plateCategoryId));
              }
              return ListView(
                children: <Widget>[
                  Center(
                    child: Wrap(
                      runSpacing: 2,
                      spacing: 2,
                      children: buildGridItems(filtered),
                    ),
                  ),
                ],
              );
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> buildGridItems(List<Plate> plates) {
    List<Widget> list = [];
    var textStyle = TextStyle(
      shadows: [Shadow(color: Colors.black, blurRadius: 3)],
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
    for (Plate plate in plates) {
      list.add(
        InkWell(
          child: Container(
            height: _gridItemWidth,
            width: _gridItemWidth,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(plate.images[0].path)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(plate.name, style: textStyle),
                Text('R\$ ${plate.price}', style: textStyle),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PlateDetailsView(plate)));
          },
        ),
      );
    }
    return list;
  }
}

// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------

class CategoryFilterCard extends StatefulWidget {
  final category;

  CategoryFilterCard(this.category);

  @override
  _CategoryFilterCardState createState() => _CategoryFilterCardState(category);
}

class _CategoryFilterCardState extends State<CategoryFilterCard> {
  final catController = GetIt.I.get<CategoryController>();
  var category;

  _CategoryFilterCardState(this.category);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1.00, color: Color(0xffcccccc)),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Observer(builder: (_) {
          var _isSelected = catController.selectedCategories.contains(category['id']);
          return Material(
            color: _isSelected ? Colors.red : Colors.white,
            type: MaterialType.button,
            elevation: 1,
            child: InkWell(
              splashColor: Colors.red[50],
              onTap: () {
                catController.toggleCategory(category['id']);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                child: Text(
                  category['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: _isSelected ? Colors.white : Colors.grey[700],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
