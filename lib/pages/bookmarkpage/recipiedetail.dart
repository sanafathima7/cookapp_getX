import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/pages/bookmarkpage/widgets/editrecipie.dart'; // Ensure you have the correct import for RecipeEditPage

class RecipeDetailPage extends StatelessWidget {
  final int recipeKey;
  final String recipeName;
  final String recipeDetails;

  RecipeDetailPage({
    required this.recipeKey,
    required this.recipeName,
    required this.recipeDetails,
  });

  final InsertController insertController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Check if the recipe is a favorite
    bool isFavorite = insertController.recipeData.firstWhere(
      (recipe) => recipe['key'] == recipeKey,
      orElse: () => {'isFavorite': false},
    )['isFavorite'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 60, 141),
        title: Text(recipeName),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to the RecipeEditPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeEditPage(
                    recipeKey: recipeKey,
                    name: recipeName,
                    details: recipeDetails,
                  ),
                ),
              ).then((_) {
                // Optionally refresh the details after returning from edit page
                // This could be implemented with a state management solution as well
                // For example, you could use GetX to refresh the page
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recipe Name: $recipeName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recipe Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              recipeDetails,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertController.toggleFavorite(recipeKey);
        },
        backgroundColor: Color.fromARGB(255, 178, 164, 187),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite
              ? Colors.red
              : Colors.white, // Correct color based on favorite state
        ),
      ),
    );
  }
}
