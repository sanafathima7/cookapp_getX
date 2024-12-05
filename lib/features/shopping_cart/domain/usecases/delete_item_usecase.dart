import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';

class DeleteItemUseCase {
  final ItemRepository itemRepository;

  DeleteItemUseCase(this.itemRepository);

  Future<DataState<void>> call(int id) async {
    return await itemRepository.deleteItem(id);
  }
}
