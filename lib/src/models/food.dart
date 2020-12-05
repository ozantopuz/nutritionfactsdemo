import 'label_nutrients.dart';

class Food {
  int fdcId;
  String description;
  String lowercaseDescription;
  double score;
  String publicationDate;
  String dataType;
  String foodClass;
  String modifiedDate;
  String availableDate;
  String brandOwner;
  String dataSource;
  String brandedFoodCategory;
  String gtinUpc;
  String householdServingFullText;
  String ingredients;
  String marketCountry;
  double servingSize;
  String servingSizeUnit;
  LabelNutrients labelNutrients;

  Food(
      {this.fdcId,
      this.description,
      this.lowercaseDescription,
      this.score,
      this.publicationDate,
      this.dataType,
      this.foodClass,
      this.modifiedDate,
      this.availableDate,
      this.brandOwner,
      this.dataSource,
      this.brandedFoodCategory,
      this.gtinUpc,
      this.householdServingFullText,
      this.ingredients,
      this.marketCountry,
      this.servingSize,
      this.servingSizeUnit,
      this.labelNutrients});

  Food.fromJson(Map<String, dynamic> json) {
    fdcId = json['fdcId'];
    description = json['description'];
    lowercaseDescription = json['lowercaseDescription'];
    score = json['score'];
    publicationDate = json['publicationDate'];
    dataType = json['dataType'];
    foodClass = json['foodClass'];
    modifiedDate = json['modifiedDate'];
    availableDate = json['availableDate'];
    brandOwner = json['brandOwner'];
    dataSource = json['dataSource'];
    brandedFoodCategory = json['brandedFoodCategory'];
    gtinUpc = json['gtinUpc'];
    householdServingFullText = json['householdServingFullText'];
    ingredients = json['ingredients'];
    marketCountry = json['marketCountry'];
    servingSize = json['servingSize'];
    servingSizeUnit = json['servingSizeUnit'];
    labelNutrients = json['labelNutrients'] != null
        ? new LabelNutrients.fromJson(json['labelNutrients'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fdcId'] = this.fdcId;
    data['description'] = this.description;
    data['lowercaseDescription'] = this.lowercaseDescription;
    data['score'] = this.score;
    data['publicationDate'] = this.publicationDate;
    data['dataType'] = this.dataType;
    data['foodClass'] = this.foodClass;
    data['modifiedDate'] = this.modifiedDate;
    data['availableDate'] = this.availableDate;
    data['brandOwner'] = this.brandOwner;
    data['dataSource'] = this.dataSource;
    data['brandedFoodCategory'] = this.brandedFoodCategory;
    data['gtinUpc'] = this.gtinUpc;
    data['householdServingFullText'] = this.householdServingFullText;
    data['ingredients'] = this.ingredients;
    data['marketCountry'] = this.marketCountry;
    data['servingSize'] = this.servingSize;
    data['servingSizeUnit'] = this.servingSizeUnit;
    if (this.labelNutrients != null) {
      data['labelNutrients'] = this.labelNutrients.toJson();
    }
    return data;
  }
}
