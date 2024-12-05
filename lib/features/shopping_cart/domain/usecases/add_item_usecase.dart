import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/shopping_cart/domain/entities/item.dart';
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';

class AddItemUseCase {
  final ItemRepository itemRepository;

  AddItemUseCase(this.itemRepository);

  Future<DataState<void>> call(Item item) async {
    return await itemRepository.addItem(item);
  }
}
