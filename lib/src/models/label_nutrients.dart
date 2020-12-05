import 'fat.dart';
import 'trans_fat.dart';

class LabelNutrients {
  Fat fat;
  Fat saturatedFat;
  TransFat transFat;
  TransFat cholesterol;
  TransFat sodium;
  Fat carbohydrates;
  Fat fiber;
  Fat sugars;
  Fat protein;
  Fat calcium;
  Fat iron;
  Fat potassium;
  TransFat calories;

  LabelNutrients(
      {this.fat,
      this.saturatedFat,
      this.transFat,
      this.cholesterol,
      this.sodium,
      this.carbohydrates,
      this.fiber,
      this.sugars,
      this.protein,
      this.calcium,
      this.iron,
      this.potassium,
      this.calories});

  LabelNutrients.fromJson(Map<String, dynamic> json) {
    fat = json['fat'] != null ? new Fat.fromJson(json['fat']) : null;
    saturatedFat = json['saturatedFat'] != null
        ? new Fat.fromJson(json['saturatedFat'])
        : null;
    transFat = json['transFat'] != null
        ? new TransFat.fromJson(json['transFat'])
        : null;
    cholesterol = json['cholesterol'] != null
        ? new TransFat.fromJson(json['cholesterol'])
        : null;
    sodium =
        json['sodium'] != null ? new TransFat.fromJson(json['sodium']) : null;
    carbohydrates = json['carbohydrates'] != null
        ? new Fat.fromJson(json['carbohydrates'])
        : null;
    fiber = json['fiber'] != null ? new Fat.fromJson(json['fiber']) : null;
    sugars = json['sugars'] != null ? new Fat.fromJson(json['sugars']) : null;
    protein =
        json['protein'] != null ? new Fat.fromJson(json['protein']) : null;
    calcium =
        json['calcium'] != null ? new Fat.fromJson(json['calcium']) : null;
    iron = json['iron'] != null ? new Fat.fromJson(json['iron']) : null;
    potassium =
        json['potassium'] != null ? new Fat.fromJson(json['potassium']) : null;
    calories = json['calories'] != null
        ? new TransFat.fromJson(json['calories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fat != null) {
      data['fat'] = this.fat.toJson();
    }
    if (this.saturatedFat != null) {
      data['saturatedFat'] = this.saturatedFat.toJson();
    }
    if (this.transFat != null) {
      data['transFat'] = this.transFat.toJson();
    }
    if (this.cholesterol != null) {
      data['cholesterol'] = this.cholesterol.toJson();
    }
    if (this.sodium != null) {
      data['sodium'] = this.sodium.toJson();
    }
    if (this.carbohydrates != null) {
      data['carbohydrates'] = this.carbohydrates.toJson();
    }
    if (this.fiber != null) {
      data['fiber'] = this.fiber.toJson();
    }
    if (this.sugars != null) {
      data['sugars'] = this.sugars.toJson();
    }
    if (this.protein != null) {
      data['protein'] = this.protein.toJson();
    }
    if (this.calcium != null) {
      data['calcium'] = this.calcium.toJson();
    }
    if (this.iron != null) {
      data['iron'] = this.iron.toJson();
    }
    if (this.potassium != null) {
      data['potassium'] = this.potassium.toJson();
    }
    if (this.calories != null) {
      data['calories'] = this.calories.toJson();
    }
    return data;
  }
}
