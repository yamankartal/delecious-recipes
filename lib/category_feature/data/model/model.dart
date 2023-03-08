import 'package:hive_flutter/adapters.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  List<Meal>? meals;

  CategoryModel({this.meals});

  factory CategoryModel.fromJson(Map json) {
    List hits = json['hits'] ?? [];
    List<Meal> list = hits.map((e) => Meal.fromJson(e)).toList();

    return CategoryModel(meals: list);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.meals != null) {
      data['hits'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Meal {
  @HiveField(0)
  Recipe? recipe;

  Meal({this.recipe});

  Meal.fromJson(Map<String, dynamic> json) {
    recipe =
        json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Recipe {
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? label;
  @HiveField(3)
  List<String>? dietLabels;
  @HiveField(4)
  List<String>? healthLabels;
  @HiveField(5)
  List<Ingredients>? ingredients;
  @HiveField(7)
  double? calories;
  @HiveField(8)
  double? totalWeight;
  @HiveField(9)
  List<String>? mealType;
  @HiveField(10)
  List<String>? dishType;
  @HiveField(11)
  List<TotalNutrientsValue>? nutrientsValue;
  @HiveField(12)
  List<String>? cautions;
  List<String>? nutrientsKey;

  Recipe({
    this.cautions,
    this.nutrientsKey,
    this.nutrientsValue,
    this.dietLabels,
    this.healthLabels,
    this.label,
    this.image,
    this.dishType,
    this.mealType,
    this.totalWeight,
    this.ingredients,
    this.calories,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    if (json['totalNutrients'] != null) {
      nutrientsKey = [];
      nutrientsValue = [];
      Map map = json['totalNutrients'];
      map.forEach((key, value) {
        nutrientsKey!.add(key);
        nutrientsValue!.add(TotalNutrientsValue.fromJson(value));
      });
    }
    dietLabels = json['dietLabels'].cast<String>();
    healthLabels = json['healthLabels'].cast<String>();

    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    totalWeight = json['totalWeight'];

    mealType = json['mealType'].cast<String>();
    dishType = json['dishType'].cast<String>();
    image = json['image'];
    label = json['label'];
    cautions = json['cautions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['label'] = this.label;
    data['dietLabels'] = this.dietLabels;
    data['healthLabels'] = this.healthLabels;
    data['cautions'] = this.cautions;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['calories'] = this.calories;
    data['totalWeight'] = this.totalWeight;

    data['mealType'] = this.mealType;
    data['dishType'] = this.dishType;

    if (nutrientsKey != null && nutrientsValue != null) {
      Map map = {};
      for (int i = 0; i < nutrientsKey!.length; i++) {
        map.addAll({nutrientsKey: nutrientsValue});
      }
      data['totalNutrients'] = map;
    }

    return data;
  }
}

@HiveType(typeId: 3)
class Ingredients {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? image;

  double? weight;
  String? foodCategory;
  String? foodId;

  Ingredients(
      {this.text, this.weight, this.foodCategory, this.foodId, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['weight'] = this.weight;
    data['foodCategory'] = this.foodCategory;
    data['foodId'] = this.foodId;
    data['image'] = this.image;
    return data;
  }
}

@HiveType(typeId: 4)
class TotalNutrientsValue {
  @HiveField(0)
  final String? label;
  @HiveField(1)
  final double? quantity;
  @HiveField(2)
  final String? unit;

  TotalNutrientsValue({this.label, this.quantity, this.unit});

  factory TotalNutrientsValue.fromJson(Map<String, dynamic> map) =>
      TotalNutrientsValue(
          label: map['label'], quantity: map['quantity'], unit: map['unit']);
}
