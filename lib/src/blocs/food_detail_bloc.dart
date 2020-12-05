import '../models/food.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class FoodDetailBloc {
  final _repository = Repository();
  final _foodDetailFetcher = PublishSubject<Food>();

  Stream<Food> get foodDetail => _foodDetailFetcher.stream;

  fetchFoodDetail(int id) async {
    Food food = await _repository.fetchFood(id);
    _foodDetailFetcher.sink.add(food);
  }

  dispose() {
    _foodDetailFetcher.close();
  }
}

final bloc = FoodDetailBloc();
