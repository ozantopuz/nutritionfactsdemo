import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../constants/constants.dart' as Constants;
import '../models/food.dart';
import '../models/search_item.dart';

class ApiProvider {
  Client client = Client();
  final _apiKey = Constants.API_KEY;
  final _baseUrl = Constants.BASE_URL;

  Future<SearchItem> fetchSearchItem(String body) async {
    Response response = await client.post(
        "$_baseUrl/foods/search?api_key=$_apiKey",
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SearchItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load search foods');
    }
  }

  Future<Food> fetchFood(int id) async {
    Response response = await client.get("$_baseUrl/food/" +
        id.toString() +
        "?nutrients=203&nutrients=204&nutrients=205&api_key=$_apiKey");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Food.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load food');
    }
  }
}
