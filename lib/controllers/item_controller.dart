import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ItemController extends GetxController {
  late Box box;
  RxList<Map<String, dynamic>> ItemData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box('itemdb');
    loadItem();
  }

  // Load all recipes from the Hive database
  void loadItem() {
    ItemData.clear();
    final allRecipes = box.toMap();
    allRecipes.forEach((key, value) {
      ItemData.add({
        'key': key,
        'item': value['item'],
      });
    });
  }

  // Add a new recipe to the database and list
  Future<void> addItem(String item) async {
    final key = await box.add({'item': item});
    ItemData.add({
      'key': key,
      'item': item,
    });
  }

  // Edit an existing recipe by updating its values
  void editItem(int key, String item) {
    if (box.containsKey(key)) {
      // final isFavorite = box.get(key)['isFavorite'] ?? false;
      box.put(key, {'item': item});

      int index = ItemData.indexWhere((element) => element['key'] == key);
      if (index != -1) {
        ItemData[index] = {
          'key': key,
          'item': item,
        };
      }
    }
  }

  // Delete a recipe from the database and list
  void deleteitem(int key) {
    if (box.containsKey(key)) {
      box.delete(key);
      ItemData.removeWhere((element) => element['key'] == key);
      // filteredRecipes.value = recipeData; // Update filtered list after deletion
      // loadFavorites(); // Update favorites if the deleted recipe was in favorites
    }
  }
}
