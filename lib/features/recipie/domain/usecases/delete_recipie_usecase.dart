import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class DeleteRecipe {
  final RecipeRepository repository;

  DeleteRecipe(this.repository);

  Future<void> call(int id) async {
    await repository.deleteRecipe(id);
  }
}
