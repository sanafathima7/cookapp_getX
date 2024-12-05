import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart';

abstract class ItemRepository {
  /// Adds an item to the repository.
  Future<DataState<void>> addItem(Item item);

  /// Retrieves all items from the repository.
  Future<DataState<List<Item>>> getAllItems();

  /// Updates an existing item in the repository.
  Future<DataState<void>> updateItem(int id, Item item);

  /// Deletes an item from the repository.
  Future<DataState<void>> deleteItem(int id);
}
