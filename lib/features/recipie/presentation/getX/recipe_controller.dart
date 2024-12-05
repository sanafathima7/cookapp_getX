import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InsertController extends GetxController {
  late Box box;
  RxList<Map<String, dynamic>> recipeData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> favoriteRecipes = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredRecipes = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initHive(); // Initialize Hive and load data
  }

  // Initialize Hive storage (for web, no need for path_provider)
  Future<void> _initHive() async {
    await Hive.initFlutter(); // For web support, use initFlutter()
    box = await Hive.openBox('Database');
    loadRecipes();
    loadFavorites();
  }

  // Load all recipes from the Hive database
  void loadRecipes() {
    recipeData.clear();
    final allRecipes = box.toMap();

    // Sort by index (order in the list)
    final sortedRecipes = allRecipes.entries.toList()
      ..sort(
          (a, b) => (a.value['index'] ?? 0).compareTo(b.value['index'] ?? 0));

    for (var entry in sortedRecipes) {
      recipeData.add({
        'key': entry.key,
        'name': entry.value['name'],
        'details': entry.value['details'],
        'isFavorite': entry.value['isFavorite'] ?? false,
        'index': entry.value['index'] ?? 0,
      });
    }
    filteredRecipes.value = recipeData; // Initialize filtered list
    loadFavorites(); // Ensure favorites are updated after loading recipes
  }

  // Add a new recipe to the database and list
  Future<void> addRecipe(String name, String details) async {
    final key = await box.add({
      'name': name,
      'details': details,
      'isFavorite': false,
      'index': recipeData.length, // Assign new index at the end of the list
    });
    recipeData.add({
      'key': key,
      'name': name,
      'details': details,
      'isFavorite': false,
      'index': recipeData.length, // Store new index
    });
    filteredRecipes.value = recipeData; // Update filtered list after adding
  }

  // Move a recipe within the list and save new index order
  void moveRecipe(int oldIndex, int newIndex) {
    if (newIndex < 0 || newIndex >= recipeData.length) return;

    final item = recipeData.removeAt(oldIndex);
    recipeData.insert(newIndex, item);

    // Update index in both list and database
    for (int i = 0; i < recipeData.length; i++) {
      recipeData[i]['index'] = i; // Update index in the list
      box.put(recipeData[i]['key'],
          {...recipeData[i], 'index': i}); // Update index in Hive
    }
    filteredRecipes.value = recipeData; // Refresh filtered list with new order
    update(); // Notify listeners of the change
  }

  // Other existing methods (loadFavorites, addRecipe, deleteRecipe, etc.)
  // Edit an existing recipe by updating its values
  void editRecipe(int key, String name, String details) {
    if (box.containsKey(key)) {
      final isFavorite = box.get(key)['isFavorite'] ?? false;
      box.put(
          key, {'name': name, 'details': details, 'isFavorite': isFavorite});

      int index = recipeData.indexWhere((element) => element['key'] == key);
      if (index != -1) {
        recipeData[index] = {
          'key': key,
          'name': name,
          'details': details,
          'isFavorite': isFavorite,
        };
      }
      filteredRecipes.value = recipeData; // Update filtered list after editing
    }
  }

  // Delete a recipe from the database and list
  void deleteRecipe(int key) {
    if (box.containsKey(key)) {
      box.delete(key);
      recipeData.removeWhere((element) => element['key'] == key);
      filteredRecipes.value = recipeData; // Update filtered list after deletion
      loadFavorites(); // Update favorites if the deleted recipe was in favorites
    }
  }

  // Toggle a recipe's favorite status
  void toggleFavorite(int key) {
    if (box.containsKey(key)) {
      final recipe = box.get(key);
      final isFavorite = recipe['isFavorite'] ?? false;
      box.put(key, {...recipe, 'isFavorite': !isFavorite});

      int index = recipeData.indexWhere((element) => element['key'] == key);
      if (index != -1) {
        recipeData[index] = {...recipeData[index], 'isFavorite': !isFavorite};
      }
      loadFavorites();
    }
  }

  // Load favorite recipes into the favoriteRecipes list
  void loadFavorites() {
    favoriteRecipes.clear();
    favoriteRecipes
        .addAll(recipeData.where((recipe) => recipe['isFavorite'] == true));
  }

  // Get the count of favorite recipes
  Future<int> getFavoriteCount() async {
    return favoriteRecipes.length;
  }

  // Get the list of favorite recipes
  Future<List<Map<String, dynamic>>> getFavoriteRecipes() async {
    return Future.value(favoriteRecipes.toList());
  }

  // Search for recipes by name or details
  void searchRecipes(String query) {
    if (query.isEmpty) {
      filteredRecipes.value = recipeData; // Show all if the query is empty
    } else {
      filteredRecipes.value = recipeData
          .where((recipe) =>
              recipe['name']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              recipe['details']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }
}
