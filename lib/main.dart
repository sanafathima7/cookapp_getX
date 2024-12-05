import 'package:cookapp/pages/homepage/language/localisation_lang.dart';
import 'package:cookapp/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('language');
  await Hive.openBox('Database');
  await Hive.openBox('itemdb');

  // Hive.registerAdapter(RecipeAdapter());
  // Hive.registerAdapter(ItemAdapter());

  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Recipe Center',
//       theme: ThemeData.light(),
//       locale: Get.locale, // Use Get.locale for dynamic updates
//       fallbackLocale:
//           const Locale('en', 'US'), // Default to English if locale is null
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         AppLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', 'US'),
//         Locale('ml', 'IN'),
//       ],
//       localeResolutionCallback: (locale, supportedLocales) {
//         for (var supportedLocale in supportedLocales) {
//           if (supportedLocale.languageCode == locale?.languageCode) {
//             return supportedLocale;
//           }
//         }
//         return supportedLocales.first;
//       },
//       home: const SplashScreen(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final Map<String, String> translations;

//   const MyApp(this.translations, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Recipe Center',
//       theme: ThemeData.light(),
//       locale: Get.locale,
//       fallbackLocale: const Locale('en', 'US'),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         AppLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', 'US'),
//         Locale('ml', 'IN'),
//       ],
//       localeResolutionCallback: (locale, supportedLocales) {
//         for (var supportedLocale in supportedLocales) {
//           if (supportedLocale.languageCode == locale?.languageCode) {
//             return supportedLocale;
//           }
//         }
//         return supportedLocales.first;
//       },
//       home: SplashScreen(), // Pass translations to SplashScreen
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('language');
    final localeString = box.get('locale', defaultValue: 'en_US');
    final localeParts = localeString.split('_');
    final locale =
        Locale(localeParts[0], localeParts.length > 1 ? localeParts[1] : '');

    return GetMaterialApp(
      locale: locale,
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'Cook App',

      fallbackLocale: Locale('en', 'US'), // Fallback locale
      home: const SplashScreen(),
    );
  }
}
