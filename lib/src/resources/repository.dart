import 'dart:async';

import '../models/food.dart';
import '../models/search_item.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<SearchItem> fetchSearchItem(String body) =>
      apiProvider.fetchSearchItem(body);

  Future<Food> fetchFood(int id) => apiProvider.fetchFood(id);
}
