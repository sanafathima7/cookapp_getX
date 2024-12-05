import 'package:cookapp/features/shopping_cart/data/models/item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'item_data_source.dart';

class ItemDataSourceImpl implements ItemDataSource {
  late Box<Item> box; // Box to store data as Item objects

  @override
  Future<void> initHive() async {
    // Initializes Hive and opens the 'itemdb' box
    await Hive.initFlutter();
    Hive.registerAdapter(ItemAdapter()); // Registers the Item adapter for Hive
    box = await Hive.openBox<Item>('itemdb');
  }

  @override
  Future<List<Item>> getAllItem() async {
    try {
      return box.values.toList(); // Retrieves all items from the box
    } catch (e) {
      print('Error retrieving items: $e');
      return []; // Returns an empty list in case of an error
    }
  }

  @override
  Future<int> addItem(Item item) async {
    try {
      return await box.add(item); // Adds an item and returns its key
    } catch (e) {
      print('Error adding item: $e');
      rethrow; // Rethrows the exception for handling by the caller
    }
  }

  @override
  Future<void> updateItem(int key, Item item) async {
    if (await containsItem(key)) {
      try {
        await box.put(key, item); // Updates the item with the given key
      } catch (e) {
        print('Error updating item: $e');
        rethrow; // Rethrows the exception for handling by the caller
      }
    } else {
      throw Exception('Item not found');
    }
  }

  @override
  Future<void> deleteItem(int key) async {
    if (await containsItem(key)) {
      try {
        await box.delete(key); // Deletes the item with the given key
      } catch (e) {
        print('Error deleting item: $e');
        rethrow; // Rethrows the exception for handling by the caller
      }
    } else {
      throw Exception('Item not found');
    }
  }

  @override
  Future<bool> containsItem(int key) async {
    return await box
        .containsKey(key); // Checks if an item with the given key exists
  }

  @override
  Item? getItem(int key) {
    return box.get(
        key); // Retrieves the item with the given key, or null if not found
  }
}
