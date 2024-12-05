import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class AddRecipe {
  final RecipeRepository repository;

  AddRecipe(this.repository);

  Future<void> call(String name, String details) async {
    // Create a new Recipe entity
    final recipe = Recipe(
      id: DateTime.now().millisecondsSinceEpoch, // or use a generated ID
      name: name,
      details: details,
      isFavorite: false,
      index: 0, // Or set it as needed based on the context
    );
    await repository.addRecipe(recipe);
  }
}
