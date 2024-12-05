import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart';
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';

class UpdateItemUseCase {
  final ItemRepository itemRepository;

  UpdateItemUseCase(this.itemRepository);

  Future<DataState<void>> call(int id, Item item) async {
    return await itemRepository.updateItem(id, item);
  }
}
