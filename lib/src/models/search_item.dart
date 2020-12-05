import 'food.dart';

class SearchItem {
  int totalHits;
  int currentPage;
  int totalPages;
  List<Food> foods;

  SearchItem({this.totalHits, this.currentPage, this.totalPages, this.foods});

  SearchItem.fromJson(Map<String, dynamic> json) {
    totalHits = json['totalHits'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    if (json['foods'] != null) {
      foods = new List<Food>();
      json['foods'].forEach((v) {
        foods.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalHits'] = this.totalHits;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
