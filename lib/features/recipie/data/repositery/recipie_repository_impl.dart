// // import 'package:cookapp/core/resources/data_state.dart';
// // import 'package:cookapp/features/recipe/data/data_source/recipie_data_source.dart';
// // import 'package:cookapp/features/recipe/domain/entities/recipie.dart';
// // import 'package:cookapp/features/recipe/domain/repositeries/recipe_repositeries.dart';

// // class RecipeRepositoryImpl implements RecipeRepository {  final RecipeDataSource dataSource;

// //   RecipeRepositoryImpl(this.dataSource);

// //   @override
// //   Future<List<Map<String, dynamic>>> getAllRecipes() async {
// //     final allRecipes = await dataSource.getAllRecipes();

// //     // Sort recipes by 'index'
// //     final sortedRecipes = allRecipes.entries.toList()
// //       ..sort(
// //           (a, b) => (a.value['index'] ?? 0).compareTo(b.value['index'] ?? 0));

// //     // Transform entries into list of maps
// //     return sortedRecipes
// //         .map((entry) => {
// //               'key': entry.key,
// //               'name': entry.value['name'],
// //               'details': entry.value['details'],
// //               'isFavorite': entry.value['isFavorite'] ?? false,
// //               'index': entry.value['index'] ?? 0,
// //             })
// //         .toList();
// //   }

// //   Future<int> addRecipe(String name, String details, int index) async {
// //     final recipe = {
// //       'name': name,
// //       'details': details,
// //       'isFavorite': false,
// //       'index': index,
// //     };
// //     return await dataSource.addRecipe(recipe);
// //   }

// //   Future<void> updateRecipe(
// //       int key, String name, String details, bool isFavorite) async {
// //     final updatedRecipe = {
// //       'name': name,
// //       'details': details,
// //       'isFavorite': isFavorite,
// //     };
// //     await dataSource.updateRecipe(key, updatedRecipe);
// //   }

// //   Future<void> deleteRecipe(int key) async {
// //     await dataSource.deleteRecipe(key);
// //   }

// //   Future<void> toggleFavorite(int key) async {
// //     final recipe = dataSource.getRecipe(key);
// //     if (recipe != null) {
// //       final updatedRecipe = {
// //         ...recipe,
// //         'isFavorite': !(recipe['isFavorite'] ?? false),
// //       };
// //       await dataSource.updateRecipe(key, updatedRecipe);
// //     }
// //   }

// //   Future<List<Map<String, dynamic>>> getFavorites() async {
// //     final recipes = await getAllRecipes();
// //     return recipes.where((recipe) => recipe['isFavorite'] == true).toList();
// //   }

// //   @override
// //   Future<DataState<int>> getFavoriteCount() {
// //     // TODO: implement getFavoriteCount
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<DataState<List<Recipe>>> getFavoriteRecipes() {
// //     // TODO: implement getFavoriteRecipes
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<DataState<Recipe?>> getRecipeById(int id) {
// //     // TODO: implement getRecipeById
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<DataState<List<Recipe>>> searchRecipes(String query) {
// //     // TODO: implement searchRecipes
// //     throw UnimplementedError();
// //   }
// // }
// import 'package:cookapp/core/resources/data_state.dart';
// import 'package:cookapp/core/resources/data_state.dart';
// import 'package:cookapp/features/cook_app/data/data_source/recipie_data_source.dart';
// import 'package:cookapp/features/cook_app/domain/entities/recipie.dart';
// import 'package:cookapp/features/cook_app/domain/repositeries/recipe_repositeries.dart';
// import 'package:dio/src/dio_exception.dart';

// class RecipeRepositoryImpl implements RecipeRepository {
//   final RecipeDataSource dataSource;

//   RecipeRepositoryImpl(this.dataSource);

//   @override
//   Future<DataState<List<Recipe>>> getAllRecipes() async {
//     try {
//       final allRecipes = await dataSource.getAllRecipes();

//       // Sort recipes by 'index'
//       final sortedRecipes = allRecipes.entries.toList()
//         ..sort((a, b) => (a.value['index'] ?? 0).compareTo(b.value['index'] ?? 0));

//       // Convert the sorted recipes to List<Recipe>
//       final recipes = sortedRecipes
//           .map((entry) => Recipe(
//                 id: entry.key,
//                 name: entry.value['name'],
//                 details: entry.value['details'],
//                 isFavorite: entry.value['isFavorite'] ?? false,
//                 index: entry.value['index'] ?? 0,
//               ))
//           .toList();

//       // Return the recipes wrapped in DataState
//       return DataSuccess(recipes);
//     } catch (e) {
//       return DataFailed('Failed to fetch recipes: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<void>> addRecipe(String name, String details, int index) async {
//     try {
//       final recipe = {
//         'name': name,
//         'details': details,
//         'isFavorite': false,
//         'index': index,
//       };
//       await dataSource.addRecipe(recipe);
//       return DataSuccess(null); // Success, but no value
//     } catch (e) {
//       return DataFailed('Failed to add recipe: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<void>> updateRecipe(
//       int key, String name, String details, bool isFavorite) async {
//     try {
//       final updatedRecipe = {
//         'name': name,
//         'details': details,
//         'isFavorite': isFavorite,
//       };
//       await dataSource.updateRecipe(key, updatedRecipe);
//       return DataSuccess(null); // Success, but no value
//     } catch (e) {
//       return DataFailed('Failed to update recipe: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<void>> deleteRecipe(int key) async {
//     try {
//       await dataSource.deleteRecipe(key);
//       return DataSuccess(null); // Success, but no value
//     } catch (e) {
//       return DataFailed('Failed to delete recipe: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<void>> toggleFavorite(int key) async {
//     try {
//       final recipe = await dataSource.getRecipe(key);
//       if (recipe != null) {
//         final updatedRecipe = {
//           ...recipe,
//           'isFavorite': !(recipe['isFavorite'] ?? false),
//         };
//         await dataSource.updateRecipe(key, updatedRecipe);
//       }
//       return DataSuccess(null); // Success, but no value
//     } catch (e) {
//       return DataFailed('Failed to toggle favorite: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<List<Recipe>>> getFavorites() async {
//     try {
//       final recipes = await getAllRecipes();
//       if (recipes is DataSuccess) {
//         final favorites = recipes.data.where((recipe) => recipe.isFavorite).toList();
//         return DataSuccess(favorites);
//       }
//       return DataFailed('Failed to fetch favorites' as DioError);
//     } catch (e) {
//       return DataFailed('Failed to fetch favorites: $e' as DioError);
//     }
//   }

//   @override
//   Future<DataState<int>> getFavoriteCount() {
//     // TODO: implement getFavoriteCount
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataState<List<Recipe>>> getFavoriteRecipes() {
//     // TODO: implement getFavoriteRecipes
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataState<Recipe?>> getRecipeById(int id) {
//     // TODO: implement getRecipeById
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataState<List<Recipe>>> searchRecipes(String query) {
//     // TODO: implement searchRecipes
//     throw UnimplementedError();
//   }
// }
import 'package:cookapp/core/resources/data_state.dart';
import 'package:cookapp/features/recipie/data/data_source/recipie_data_source.dart';
import 'package:cookapp/features/recipie/domain/entities/recipie.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';
import 'package:dio/dio.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;

  RecipeRepositoryImpl(this.dataSource);

  @override
  Future<DataState<List<Recipe>>> getAllRecipes() async {
    try {
      final allRecipes = await dataSource.getAllRecipes();

      // Sort recipes by 'index'
      final sortedRecipes = allRecipes.entries.toList()
        ..sort(
            (a, b) => (a.value['index'] ?? 0).compareTo(b.value['index'] ?? 0));

      // Convert the sorted recipes to List<Recipe>
      final recipes = sortedRecipes
          .map((entry) => Recipe(
                id: entry.key,
                name: entry.value['name'],
                details: entry.value['details'],
                isFavorite: entry.value['isFavorite'] ?? false,
                index: entry.value['index'] ?? 0,
              ))
          .toList();

      // Return the recipes wrapped in DataState
      return DataSuccess(recipes);
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'An unexpected error occurred: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> addRecipe(Recipe recipe) async {
    try {
      final newRecipe = {
        'name': recipe.name,
        'details': recipe.details,
        'isFavorite': recipe.isFavorite,
        'index': recipe.index,
      };
      await dataSource.addRecipe(newRecipe);
      return DataSuccess(null); // Success, but no value
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to add recipe: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> updateRecipe(int key, Recipe recipe) async {
    try {
      final updatedRecipe = {
        'name': recipe.name,
        'details': recipe.details,
        'isFavorite': recipe.isFavorite,
        'index': recipe.index,
      };
      await dataSource.updateRecipe(key, updatedRecipe);
      return DataSuccess(null); // Success, but no value
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to update recipe: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> deleteRecipe(int key) async {
    try {
      await dataSource.deleteRecipe(key);
      return DataSuccess(null); // Success, but no value
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to delete recipe: $e',
      ));
    }
  }

  @override
  Future<DataState<void>> toggleFavorite(int key) async {
    try {
      final recipe = await dataSource.getRecipe(key);
      if (recipe != null) {
        final updatedRecipe = {
          ...recipe,
          'isFavorite': !(recipe['isFavorite'] ?? false),
        };
        await dataSource.updateRecipe(key, updatedRecipe);
      }
      return DataSuccess(null); // Success, but no value
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to toggle favorite: $e',
      ));
    }
  }

  @override
  Future<DataState<List<Recipe>>> getFavorites() async {
    try {
      final recipes = await getAllRecipes();
      if (recipes is DataSuccess) {
        final favorites =
            recipes.data?.where((recipe) => recipe.isFavorite).toList();
        return DataSuccess(favorites!);
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch favorites',
      ));
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch favorites: $e',
      ));
    }
  }

  @override
  Future<DataState<int>> getFavoriteCount() async {
    try {
      final recipes = await getFavorites();
      if (recipes is DataSuccess) {
        return DataSuccess(recipes.data!.length);
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch favorite count',
      ));
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch favorite count: $e',
      ));
    }
  }

  @override
  Future<DataState<List<Recipe>>> getFavoriteRecipes() async {
    return getFavorites(); // Reuse the getFavorites logic
  }

  @override
  Future<DataState<Recipe?>> getRecipeById(int id) async {
    try {
      final recipe = await dataSource.getRecipe(id);
      if (recipe != null) {
        final mappedRecipe = Recipe(
          id: id,
          name: recipe['name'],
          details: recipe['details'],
          isFavorite: recipe['isFavorite'] ?? false,
          index: recipe['index'] ?? 0,
        );
        return DataSuccess(mappedRecipe);
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Recipe not found',
      ));
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch recipe: $e',
      ));
    }
  }

  @override
  Future<DataState<List<Recipe>>> searchRecipes(String query) async {
    try {
      final recipes = await getAllRecipes();
      if (recipes is DataSuccess) {
        final searchResults = recipes.data!
            .where((recipe) =>
                recipe.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return DataSuccess(searchResults);
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Search failed',
      ));
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e); // Pass the DioException directly
      }
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to search recipes: $e',
      ));
    }
  }
}
