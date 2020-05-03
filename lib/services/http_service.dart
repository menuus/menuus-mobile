import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

String _endPoint = 'https://mennus-api.rj.r.appspot.com/api';

Future fetchAlbum() async {
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getFoodCourts() async {
  var response = await http.get('$_endPoint/food_courts');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print('getFoodCourts http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getEstablishments() async {
  var response = await http.get('$_endPoint/establishments');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print('getEstablishments http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getPlates() async {
  var response = await http.get('$_endPoint/plates?include=images');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print('getPlates http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}