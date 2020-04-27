import 'package:flutter/material.dart';
import 'package:menuus_mobile/models/food_model.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  FoodDetailPage(this.food);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final double foodAvatarSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Detalhes de ${widget.food.name}!'),
      ),
      body: foodProfile,
    );
  }

  Widget get foodImage {
    return Container(
      height: foodAvatarSize,
      width: foodAvatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(widget.food.imageUrl)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2), blurRadius: 2, spreadRadius: -1, color: Color(0x33000000)),
          BoxShadow(offset: Offset(0, 1), blurRadius: 3, spreadRadius: 0, color: Color(0x24000000)),
          BoxShadow(offset: Offset(0, 3), blurRadius: 4, spreadRadius: 2, color: Color(0x1F000000)),
        ],
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 40),
        Text(' ${widget.food.rating} / 10', style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  Widget get foodProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [Colors.indigo[800], Colors.indigo[700], Colors.indigo[600], Colors.indigo[400]],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          foodImage,
          Text('${widget.food.name}  🎾', style: TextStyle(fontSize: 32.0)),
          Text(widget.food.location, style: TextStyle(fontSize: 20.0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.food.description),
          ),
          rating
        ],
      ),
    );
  }
}
