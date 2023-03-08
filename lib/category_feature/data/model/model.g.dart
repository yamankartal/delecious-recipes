// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 0;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      meals: (fields[0] as List?)?.cast<Meal>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.meals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 1;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      recipe: fields[0] as Recipe?,
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 2;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      cautions: (fields[12] as List?)?.cast<String>(),
      nutrientsValue: (fields[11] as List?)?.cast<TotalNutrientsValue>(),
      dietLabels: (fields[3] as List?)?.cast<String>(),
      healthLabels: (fields[4] as List?)?.cast<String>(),
      label: fields[2] as String?,
      image: fields[1] as String?,
      dishType: (fields[10] as List?)?.cast<String>(),
      mealType: (fields[9] as List?)?.cast<String>(),
      totalWeight: fields[8] as double?,
      ingredients: (fields[5] as List?)?.cast<Ingredients>(),
      calories: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.label)
      ..writeByte(3)
      ..write(obj.dietLabels)
      ..writeByte(4)
      ..write(obj.healthLabels)
      ..writeByte(5)
      ..write(obj.ingredients)
      ..writeByte(7)
      ..write(obj.calories)
      ..writeByte(8)
      ..write(obj.totalWeight)
      ..writeByte(9)
      ..write(obj.mealType)
      ..writeByte(10)
      ..write(obj.dishType)
      ..writeByte(11)
      ..write(obj.nutrientsValue)
      ..writeByte(12)
      ..write(obj.cautions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientsAdapter extends TypeAdapter<Ingredients> {
  @override
  final int typeId = 3;

  @override
  Ingredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredients(
      text: fields[0] as String?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredients obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalNutrientsValueAdapter extends TypeAdapter<TotalNutrientsValue> {
  @override
  final int typeId = 4;

  @override
  TotalNutrientsValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalNutrientsValue(
      label: fields[0] as String?,
      quantity: fields[1] as double?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalNutrientsValue obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalNutrientsValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
