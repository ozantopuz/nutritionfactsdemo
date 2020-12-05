import '../models/search_item.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class FoodsBloc {
  final _repository = Repository();
  final _foodsFetcher = PublishSubject<SearchItem>();

  Stream<SearchItem> get searchFoods => _foodsFetcher.stream;

  fetchSearchItem(String body) async {
    _foodsFetcher.sink.add(null);
    SearchItem searchFoods = await _repository.fetchSearchItem(body);
    _foodsFetcher.sink.add(searchFoods);
  }

  dispose() {
    _foodsFetcher.close();
  }
}

final foodsBloc = FoodsBloc();
