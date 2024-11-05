import 'package:cookapp/pages/bookmarkpage/recipiedetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/pages/bookmarkpage/widgets/insertrecipie.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});
  final InsertController insertController = Get.put(InsertController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 60, 141),
        title: const Text(
          'Recipe Notes',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeInsert()),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: insertController.recipeData.length,
          itemBuilder: (context, index) {
            final recipe = insertController.recipeData[index];
            return Card(
              elevation: 4, // Adds a shadow effect
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.all(16), // Padding within the ListTile
                leading: CircleAvatar(
                  // Placeholder image for the recipe
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    recipe['name'][0]
                        .toUpperCase(), // Display first letter of recipe name
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  recipe['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  recipe['details'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Ellipsis for overflow text
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: IconButton(
                  onPressed: () {
                    insertController.deleteRecipe(recipe['key']);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(
                        recipeKey: recipe['key'],
                        recipeName: recipe['name'],
                        recipeDetails: recipe[
                            'details'], // Pass the actual recipe details here
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
