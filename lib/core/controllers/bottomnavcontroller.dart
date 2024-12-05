import 'package:cookapp/features/cook_app/presentation/pages/bookmarkpage/bookmarkpage.dart';
import 'package:cookapp/features/cook_app/presentation/pages/bookmarkpage/widgets/favouritepage.dart';
import 'package:cookapp/features/recipie/presentation/pages/bookmarkpage.dart';
import 'package:cookapp/features/recipie/presentation/widgets/favouritepage.dart';
import 'package:cookapp/features/shopping_cart/presentation/pages/shopping_bag_list.dart';
import 'package:cookapp/pages/homepage/homepage.dart';
import 'package:cookapp/pages/shopping_cart/shopping_bag_list.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    BookmarkPage(),
    FavoritePage(),
    ShoppingBag(),
  ];
}
