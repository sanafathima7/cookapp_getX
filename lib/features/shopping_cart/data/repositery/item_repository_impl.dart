import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/data/data_source/item_data_source.dart';
import 'package:cookapp/features/shopping_cart/data/models/item.dart'; // Import the Item model
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart'
    as domain; // Import domain for conversions
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';
import 'package:dio/dio.dart';
// Import the domain version of Item
import 'package:cookapp/features/shopping_cart/data/models/item.dart' as data;

class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource dataSource;

  ItemRepositoryImpl(this.dataSource);

  @override
  Future<DataState<List<domain.Item>>> loadItems() async {
    try {
      final allItems = await dataSource.getAllItem();

      // Check if allItems is a List<Item> or convert it to a List<domain.Item>
      if (allItems != null) {
        // Directly map from Item data model to domain Item
        final items = allItems
            .map((item) => domain.Item(
                  id: item.id,
                  name: item.name,
                  item: item.item,
                ))
            .toList();

        return DataSuccess(items);
      } else {
        return DataFailed(DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'No items found',
        ));
      }
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch items: $e',
      ));
    }
  }

  // Future<DataState<domain.Item?>> getItemById(int id) async {
  //   try {
  //     final item = await dataSource.getItem(id);
  //     if (item != null) {
  //       return DataSuccess(domain.Item(
  //         id: id,
  //         name: item['name'],
  //         item: item['item'],
  //       ));
  //     }
  //     return DataFailed(DioException(
  //       requestOptions: RequestOptions(path: ''),
  //       error: 'Item not found',
  //     ));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return DataFailed(e); // Pass the DioException directly
  //     }
  //     return DataFailed(DioException(
  //       requestOptions: RequestOptions(path: ''),
  //       error: 'Failed to fetch item: $e',
  //     ));
  //   }
  // }

  @override
  Future<DataState<void>> updateItem(int key, domain.Item item) async {
    try {
      // Convert domain.Item to data.Item
      final dataItem = data.Item.fromDomainItem(item);
      await dataSource.updateItem(key, dataItem);

      return DataSuccess(null);
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e);
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to update item: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> deleteItem(int key) async {
    try {
      await dataSource.deleteItem(key);
      return DataSuccess(null); // Success, but no value returned
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to delete item: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> addItem(domain.Item item) async {
    try {
      final newItem = {
        'name': item.name,
        'item': item.item,
      };
      await dataSource.addItem(newItem as Item);
      return DataSuccess(null); // Success, but no value returned
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to add item: $e',
      ));
    }
  }

  @override
  Future<DataState<List<domain.Item>>> getAllItems() {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }
}
