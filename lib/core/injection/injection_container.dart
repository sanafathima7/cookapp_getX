import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/controllers/bottomnavcontroller.dart';
import 'package:cookapp/features/recipie/data/data_source/recipieDataSourceImpl.dart';
import 'package:cookapp/features/recipie/data/data_source/recipie_data_source.dart';
import 'package:cookapp/features/recipie/data/repositery/recipie_repository_impl.dart';
import 'package:cookapp/features/recipie/domain/repositeries/recipe_repositeries.dart';
import 'package:cookapp/features/recipie/domain/usecases/getallrecipe_usecase.dart';
import 'package:cookapp/features/shopping_cart/data/data_source/itemDataSourceImpl.dart';
import 'package:cookapp/features/shopping_cart/data/data_source/item_data_source.dart';
import 'package:cookapp/features/shopping_cart/data/repositery/item_repository_impl.dart';
import 'package:cookapp/features/shopping_cart/domain/repositeries/item_repositeries.dart';
import 'package:cookapp/features/shopping_cart/domain/usecases/edit_item_usecase.dart';
import 'package:cookapp/features/shopping_cart/domain/usecases/getallitem_usecase.dart';
import 'package:cookapp/features/shopping_cart/domain/usecases/add_item_usecase.dart';
import 'package:cookapp/features/shopping_cart/domain/usecases/delete_item_usecase.dart';
import 'package:cookapp/controllers/draggable_controller.dart'; // Import DraggableController
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register the RecipeDataSource implementation as a singleton
  s1.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());

  // Register the RecipeRepository implementation as a singleton, passing the RecipeDataSource
  s1.registerSingleton<RecipeRepository>(
      RecipeRepositoryImpl(s1<RecipeDataSource>()));

  // Register use cases for Recipe
  s1.registerSingleton<GetAllRecipesUseCase>(GetAllRecipesUseCase(s1()));

  // Register GetX controllers as needed
  s1.registerFactory<InsertController>(() => InsertController());

  // Register ItemDataSource implementation as a singleton
  s1.registerSingleton<ItemDataSource>(ItemDataSourceImpl());

  // Register the ItemRepository implementation as a singleton, passing the ItemDataSource
  s1.registerSingleton<ItemRepository>(
      ItemRepositoryImpl(s1<ItemDataSource>()));

  // Register use cases for Item
  s1.registerSingleton<GetAllItemsUseCase>(GetAllItemsUseCase(s1()));
  s1.registerSingleton<AddItemUseCase>(AddItemUseCase(s1()));
  s1.registerSingleton<UpdateItemUseCase>(UpdateItemUseCase(s1()));
  s1.registerSingleton<DeleteItemUseCase>(DeleteItemUseCase(s1()));

  // Register the DraggableController as a singleton
  s1.registerSingleton<DraggableController>(DraggableController());

  // Register the BottomNavController as a singleton
  s1.registerSingleton<BottomNavController>(BottomNavController());
}
