import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';
import 'package:dio/dio.dart';

class EditRecipe {
  final RecipeRepository repository;

  EditRecipe(this.repository);

  Future<DataState<void>> call(int id, String name, String details) async {
    try {
      // Create an updated recipe instance
      final updatedRecipe = Recipe(
        id: id,
        name: name,
        details: details,
        isFavorite: false, // Assuming we don't modify the favorite status here
        index: 0, // Set to a valid value as needed
      );

      // Call the repository to update the recipe and handle the response
      final result = await repository.updateRecipe(id, updatedRecipe);

      // Return the result from the repository
      return result;
    } catch (e) {
      // Handle any unexpected errors and return a failure
      return DataFailed<void>('Error updating recipe: $e' as DioError);
    }
  }
}
