// import 'package:cookapp/features/recipe/domain/repositeries/recipe_repositeries.dart';

// class DeleteRecipe {
//   final RecipeRepositoryImpl repository;

//   DeleteRecipe(this.repository);

//   Future<void> call(int id) async {
//     await repository.deleteRecipe(id);
//   }
// }

import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class GetAllRecipesUseCase {
  final RecipeRepository repository;

  GetAllRecipesUseCase(this.repository);

  Future<DataState<List<Recipe>>> call() async {
    return await repository.getAllRecipes();
  }
}
