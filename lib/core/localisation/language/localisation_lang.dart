import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'PINCH',
          'food_recipes': 'Food & Recipes',
          'see_all': 'SEE ALL',
          'trending_today': 'Trending Today',
          // Add more key-value pairs as needed
        },
        'ml_IN': {
          'app_title': 'PINCH',
          'food_recipes': 'ഭക്ഷണവും വിഭവങ്ങളും',
          'see_all': 'എല്ലാം കാണുക',
          'trending_today': 'ഇന്നത്തെ ട്രെൻഡിംഗ്',
          // Add more key-value pairs as needed
        },
      };
}
