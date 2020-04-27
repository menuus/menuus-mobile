import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/food_model.dart';
import 'package:menuus_mobile/pages/food_detail_page.dart';

class FoodCard extends StatefulWidget {
  final Food food;

  FoodCard(this.food);

  @override
  _FoodCardState createState() => _FoodCardState(food);
}

class _FoodCardState extends State<FoodCard> {
  Food food;
  String renderUrl;

  _FoodCardState(this.food);

  void initState() {
    super.initState();
    renderFoodPic();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showFoodDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(left: 50.0, child: foodCard),
              Positioned(top: 7.5, child: foodImage),
            ],
          ),
        ),
      ),
    );
  }

  Widget get foodImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get foodCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.food.name, style: Theme.of(context).textTheme.headline),
              Text(widget.food.location, style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[Icon(Icons.star), Text(': ${widget.food.rating} / 10')],
              )
            ],
          ),
        ),
      ),
    );
  }

  void renderFoodPic() async {
    await food.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = food.imageUrl;
      });
    }
  }

  void showFoodDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FoodDetailPage(food);
        },
      ),
    );
  }
}
