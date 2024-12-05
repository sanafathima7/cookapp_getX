import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:hive/hive.dart';

part 'recipe.g.dart'; // Generated file

@HiveType(typeId: 0)
class RecipeModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String details;
  @HiveField(3)
  final bool isFavorite;
  @HiveField(4)
  final int index;

  RecipeModel({
    required this.id,
    required this.name,
    required this.details,
    required this.isFavorite,
    required this.index,
  });

  // Convert RecipeModel to domain entity
  Recipe toEntity() {
    return Recipe(
      id: id,
      name: name,
      details: details,
      isFavorite: isFavorite,
      index: index,
    );
  }

  // Convert domain entity to RecipeModel
  factory RecipeModel.fromEntity(Recipe recipe) {
    return RecipeModel(
      id: recipe.id,
      name: recipe.name,
      details: recipe.details,
      isFavorite: recipe.isFavorite,
      index: recipe.index,
    );
  }
}
