import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';

class ToggleFavoriteStatus {
  final RecipeRepository repository;

  ToggleFavoriteStatus(this.repository);

  Future<void> call(int id) async {
    await repository.toggleFavorite(id);
  }
}
