import 'package:cookapp/features/shopping_cart/data/models/item.dart';

abstract class ItemDataSource {
  Future<void> initHive();
  Future<List<Item>> getAllItem();
  Future<int> addItem(Item item);
  Future<void> updateItem(int key, Item item);
  Future<void> deleteItem(int key);
  Future<bool> containsItem(int key);
  Item? getItem(int key);
}
