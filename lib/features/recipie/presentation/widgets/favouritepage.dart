import 'package:cookapp/features/recipie/presentation/pages/recipiedetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookapp/controllers/app_controller.dart';

class FavoritePage extends StatelessWidget {
  final InsertController insertController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 111, 60, 141),
        title: const Text('Favorite Recipes',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Favorite count display
            FutureBuilder<int>(
              future: insertController.getFavoriteCount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  int favoriteCount = snapshot.data ?? 0;
                  return Text(
                    'Favorite Count: $favoriteCount',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // List of favorite recipes
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: insertController.getFavoriteRecipes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No favorites added yet.'));
                  } else {
                    // Display list of favorite recipes
                    List<Map<String, dynamic>> favoriteRecipes = snapshot.data!;
                    return ListView.builder(
                      itemCount: favoriteRecipes.length,
                      itemBuilder: (context, index) {
                        var recipe = favoriteRecipes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              recipe['name'] ?? 'Unnamed Recipe',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 111, 60, 141)),
                            ),
                            subtitle: Text(
                              recipe['details'] ?? 'No details available',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                recipe['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: recipe['isFavorite']
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                insertController.toggleFavorite(recipe['key']);
                              },
                            ),
                            onTap: () {
                              // Navigate to recipe detail page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailPage(
                                    recipeKey: recipe['key'],
                                    recipeName: recipe['name'],
                                    recipeDetails: recipe['details'],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
