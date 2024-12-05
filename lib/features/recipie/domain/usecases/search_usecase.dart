import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class SearchRecipes {
  final RecipeRepository repository;

  SearchRecipes(this.repository);

  Future<DataState<List<Recipe>>> call(String query) async {
    return await repository.searchRecipes(query);
  }
}
