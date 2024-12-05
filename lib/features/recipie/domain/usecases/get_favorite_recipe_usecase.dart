import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class GetFavoriteRecipes {
  final RecipeRepository repository;

  GetFavoriteRecipes(this.repository);

  Future<DataState<List<Recipe>>> call() async {
    return await repository.getFavoriteRecipes();
  }
}
