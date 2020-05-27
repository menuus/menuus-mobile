import 'dart:convert' as convert;
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/models/establishment_model.dart';
import 'package:menuus_mobile/models/orders_model.dart';
import 'package:menuus_mobile/models/plate_model.dart';
import 'package:menuus_mobile/models/user_model.dart';

String _endPoint = 'https://mennus-api.rj.r.appspot.com/api';

Future getFoodCourts() async {
  var response = await http.get('$_endPoint/food_courts');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse['data'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<List<Establishment>> getEstablishments() async {
  var response = await http.get('$_endPoint/establishments?include=platesCount,images,logo');
  if (response.statusCode == 200) {
    var establishmentsData = establishmentDataListFromJson(response.body);
    return establishmentsData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<Establishment> getEstablishmentDetails(int id) async {
  var response = await http.get('$_endPoint/establishments/$id?include=plates,logo');
  if (response.statusCode == 200) {
    var establishmentData = establishmentDataFromJson(response.body);
    return establishmentData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<List<Plate>> getPlates({ int establishmentId }) async {
  var filter = establishmentId != null ? '&filter[establishment_id]=$establishmentId' : '';
  var response = await http.get('$_endPoint/plates?include=images&sort=price$filter');
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
  var response = await http.get('$_endPoint/plate_categories?include=plates&limit=99&sort=name');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var categories = jsonResponse['data'] as List<dynamic>;
    categories.removeWhere((item) => item['plates'].length < 1);
    return categories;
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

void postOrder(int establishment, List<Plate> plates) async {
  final user = GetIt.I.get<UserController>();

  Map jsonData = {
    'plates': plates.map((e) => {"plate_id": e.id, "amount": 1}).toList()
  };

  final response = await http.post(
    '$_endPoint/orders?establishment_id=$establishment',
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

Future<List<Order>> getOrders() async {
  final user = GetIt.I.get<UserController>();

  var response = await http.get(
    '$_endPoint/orders?include=plates&sort=-created_at',
    headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.userData.accessToken}'},
  );
  if (response.statusCode == 200) {
    var ordersData = ordersDataFromJson(response.body);
    return ordersData.data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
