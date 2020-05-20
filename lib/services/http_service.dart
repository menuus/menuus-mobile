import 'dart:convert' as convert;
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/models/user_model.dart';

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

Future<List<Establishment>> getEstablishments() async {
  var response = await http.get('$_endPoint/establishments?include=plates');
  if (response.statusCode == 200) {
    var establishmentsData = establishmentDataListFromJson(response.body);
    return establishmentsData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<Establishment> getEstablishmentDetails(int id) async {
  var response = await http.get('$_endPoint/establishments/$id?include=plates');
  if (response.statusCode == 200) {
    var establishmentData = establishmentDataFromJson(response.body);
    return establishmentData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<List<Plate>> getPlates() async {
  var response = await http.get('$_endPoint/plates?include=images');
  if (response.statusCode == 200) {
    var plateData = plateDataListFromJson(response.body);
    return plateData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<Plate> getPlateDetails(int id) async {
  var response = await http.get('$_endPoint/plates/$id?include=images,establishment,plate_category,menu_type');
  if (response.statusCode == 200) {
    var plateData = plateDataFromJson(response.body);
    return plateData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
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

Future<UserData> postLogin(String email, String password) async {
  var response = await http.post('$_endPoint/login?email=$email&password=$password');
  if (response.statusCode == 200) {
    var fetchUser = fetchUserFromJson(response.body);
    return fetchUser.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

void postOrder() async {
  final user = GetIt.I.get<UserController>();

  Map jsonData = {
    "plates": [
      {"plate_id": 1, "amount": 2},
      {"plate_id": 2, "amount": 1},
      {"plate_id": 3, "amount": 5}
    ]
  };

  final response = await http.post(
    '$_endPoint/orders?establishment_id=1',
    headers: {
      HttpHeaders.authorizationHeader: 'Bearer ${user.userData.accessToken}',
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: convert.jsonEncode(jsonData),
  );

  print('Token : ${user.userData.accessToken}');
  print(response.statusCode);
  print(response.body);
  print(response.headers);
  print(response.request);
}
