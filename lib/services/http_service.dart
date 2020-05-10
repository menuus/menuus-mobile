import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

String _endPoint = 'https://mennus-api.rj.r.appspot.com/api';

Future getFoodCourts() async {
  var response = await http.get('$_endPoint/food_courts');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // print('getFoodCourts http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getEstablishments() async {
  var response = await http.get('$_endPoint/establishments');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // print('getEstablishments http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getPlates() async {
  var response = await http.get('$_endPoint/plates?include=images');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // print('getPlates http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future getPlateCategories() async {
  var response = await http.get('$_endPoint/plate_categories');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // print('getPlateCategories http: ${jsonResponse['data']}.');
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}