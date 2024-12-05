import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'recipie_data_source.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  late Box<Map<String, dynamic>> box; // Ensure type safety

  @override
  Future<void> initHive() async {
    await Hive.initFlutter();
    box = await Hive.openBox<Map<String, dynamic>>('Database');
  }

  @override
  Future<Map<int, Map<String, dynamic>>> getAllRecipes() async {
    Map<int, Map<String, dynamic>> typedMap = {};
    final rawMap = box.toMap();

    rawMap.forEach((key, value) {
      if (key is int) {
        typedMap[key] = value as Map<String, dynamic>;
      }
    });

    return typedMap;
  }

  @override
  Future<int> addRecipe(Map<String, dynamic> recipe) async {
    return await box.add(recipe);
  }

  @override
  Future<void> updateRecipe(int key, Map<String, dynamic> recipe) async {
    if (await containsRecipe(key)) {
      await box.put(key, recipe);
    } else {
      throw Exception('Recipe not found');
    }
  }

  @override
  Future<void> deleteRecipe(int key) async {
    if (await containsRecipe(key)) {
      await box.delete(key);
    } else {
      throw Exception('Recipe not found');
    }
  }

  @override
  Future<bool> containsRecipe(int key) async {
    return await box.containsKey(key);
  }

  @override
  Map<String, dynamic>? getRecipe(int key) {
    return box.get(key);
  }
}
