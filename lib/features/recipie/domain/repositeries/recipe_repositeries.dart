import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';

abstract class RecipeRepository {
  Future<DataState<void>> addRecipe(Recipe recipe);

  Future<DataState<List<Recipe>>> getAllRecipes();

  Future<DataState<Recipe?>> getRecipeById(int id);

  Future<DataState<void>> updateRecipe(int id, Recipe recipe);

  Future<DataState<void>> deleteRecipe(int id);

  Future<DataState<void>> toggleFavorite(int id);

  Future<DataState<List<Recipe>>> searchRecipes(String query);

  Future<DataState<int>> getFavoriteCount();

  Future<DataState<List<Recipe>>> getFavoriteRecipes();
}
