import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart';
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';

class GetAllItemsUseCase {
  final ItemRepository itemRepository;

  GetAllItemsUseCase(this.itemRepository);

  Future<DataState<List<Item>>> call() async {
    return await itemRepository.getAllItems();
  }
}
