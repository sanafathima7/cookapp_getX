import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String details;

  Recipe({required this.name, required this.details});
}
