import 'package:cookapp/components/bottomnav.dart';
import 'package:cookapp/pages/description/descriptionpage.dart';
import 'package:cookapp/pages/homepage/widgets/listtile.dart';
import 'package:cookapp/pages/homepage/widgets/search.dart';
import 'package:cookapp/pages/homepage/widgets/trendingcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List languages = [
    {"name": "english".tr, "locale": const Locale('en', 'US')},
    {"name": "malayalam".tr, "locale": const Locale('ml', 'IN')},
  ];

  void changeLanguage(Locale locale) {
    Get.back();
    final box = Hive.box('language');
    box.put('locale', '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 111, 60, 141),
        title: Text(
          // 'PINCH',
          'app_title'.tr,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Colors.white24,
            ),
            onPressed: () {
              showDialogBox(context, languages, changeLanguage);
            }, // Call the switchLanguage method
            tooltip: 'Change Language',
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            tooltip: 'Search here',
          ),
        ],
      ),
      floatingActionButton: const MyBottomnav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'food_recipes'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'see_all'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Trendingcards(
                      imageUrl:
                          'https://pinchofyum.com/cdn-cgi/image/width=360,height=514,fit=crop/wp-content/uploads/Marry-Me-Chicken-6.jpg',
                      title: 'BREAKFAST',
                    ),
                    Trendingcards(
                      imageUrl:
                          'https://pinchofyum.com/cdn-cgi/image/width=360,height=514,fit=crop/wp-content/uploads/Beet-Salad-65.jpg',
                      title: 'BRUNCH',
                    ),
                    Trendingcards(
                      imageUrl:
                          'https://pinchofyum.com/cdn-cgi/image/width=360,height=514,fit=crop/wp-content/uploads/Black-Pepper-Beef.jpg',
                      title: 'LUNCH',
                    ),
                    Trendingcards(
                      imageUrl:
                          'https://pinchofyum.com/cdn-cgi/image/width=360,height=514,fit=crop/wp-content/uploads/sweet-potato-peanut-stew.jpg',
                      title: 'SOUPS',
                    ),
                    Trendingcards(
                      imageUrl:
                          'https://pinchofyum.com/cdn-cgi/image/width=360,height=360,fit=crop/wp-content/uploads/Scallion-Pancake-with-Eggs.jpg',
                      title: 'HEALTHY',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'trending_today'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'see_all'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(
                  children: [
                    NewsTile(
                      imageUrl:
                          'https://www.simplyrecipes.com/thmb/OBGcZ4gHn-hQyWqTMwkplXJs5NA=/300x200/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/simply-recipes-wine-chicken-lead-1-3-f1fa691b728e4afca42f34d5a0d081ac.jpg',
                      time: '35 mins',
                      title:
                          'My Favorite Roast Brussels sprouts Has a Secret Ingredient',
                      author: 'EASY DINNERS',
                      fun: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionPage(),
                            ),
                          );
                        });
                      },
                    ),
                    NewsTile(
                      imageUrl:
                          'https://www.simplyrecipes.com/thmb/gbr0XHadVi1vSXmWEAPQfPWF8qY=/300x200/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/simply-recipes-sheetpan-potatoes-au-gratin-7-dfd57bbc5fab4358abf46ee0930ff692.jpg',
                      time: '65 mins',
                      title:
                          'For the Best Cheesy Potatoes, Make Them In a Sheet Pan',
                      author: 'By Nick Evans',
                      fun: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DescriptionPage(),
                          ),
                        );
                      },
                    ),
                    NewsTile(
                      imageUrl:
                          'https://www.simplyrecipes.com/thmb/kTAXTsmJOwaT8ESt3VjiowbkidE=/390x260/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__01__Sheet_Pan_BBQ_Pizza_HERO-HORIZONTAL-831f3dc1c7c441eabcde40ba0394dd28.jpg',
                      time: '30 mins',
                      title: 'BBQ Chicken Sheet Pan Pizza',
                      author: 'PIZZAS',
                      fun: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DescriptionPage(),
                          ),
                        );
                      },
                    ),
                    NewsTile(
                      imageUrl:
                          'https://www.simplyrecipes.com/thmb/AO7reYO5yGD_3xioIfbErUQ5dtc=/390x260/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Simply-Recipes-Copycat-Olive-Garden-Chicken-Gnocchi-Soup-LEAD-4-685-eadcd39c13ab4146a4caa1c9335f99db.jpg',
                      time: '25 min',
                      title: 'Copycat Olive Garden Chicken & Gnocchi Soup',
                      author: 'VOICES',
                      fun: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DescriptionPage()),
                        );
                      },
                    ),
                    NewsTile(
                      imageUrl:
                          'https://www.simplyrecipes.com/thmb/UrrMdauLFCMc6SfGCbj_KQH8X3k=/390x260/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Simply-Recipes-Chicken-Caesar-Wrap-LEAD-4-3462748031b34985b4b4cc27b4165bf0.jpg',
                      time: '20 mins',
                      title: 'Chicken Caesar Wrap',
                      author: 'CHICKEN WRAPS',
                      fun: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DescriptionPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogBox(BuildContext context, List<dynamic> languages,
      void Function(Locale locale) changeLanguage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('languages'.tr),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              itemCount: languages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => changeLanguage(languages[index]['locale']),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      languages[index]['name'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        );
      },
    );
  }
}
