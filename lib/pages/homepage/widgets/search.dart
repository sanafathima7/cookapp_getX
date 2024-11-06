// import 'package:cookapp/controllers/app_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SearchPage extends StatelessWidget {
//   final InsertController recipeController = Get.put(InsertController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Recipes'),
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (query) {
//                 recipeController.searchRecipes(query);
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search recipes...',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//           ),
//           // Display filtered recipes
//           Expanded(
//             child: Obx(() {
//               // Use Obx to update the UI when recipeData changes
//               return ListView.builder(
//                 itemCount: recipeController.recipeData.length,
//                 itemBuilder: (context, index) {
//                   final recipe = recipeController.recipeData[index];
//                   return ListTile(
//                     title: Text(recipe['name']),
//                     subtitle: Text(recipe['details']),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
