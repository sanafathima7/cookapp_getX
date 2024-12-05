import 'package:cookapp/controllers/Draggable_controller.dart';
import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/features/recipie/presentation/pages/recipiedetail.dart';
import 'package:cookapp/features/recipie/presentation/widgets/insertrecipie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});
  final InsertController insertController = Get.put(InsertController());
  final DraggableController controller = Get.put(DraggableController());

  // Helper method to determine new index based on drag position
  int getNewIndex(Offset offset) {
    final itemHeight = 80.0; // Estimate the item height
    int newIndex = (offset.dy / itemHeight).floor();
    // Ensure the new index is within valid bounds
    return newIndex.clamp(0, insertController.recipeData.length - 1);
  }

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
        if (insertController.recipeData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        // Display recipes in a ListView with delete and clickable functionality
        return ListView.builder(
          itemCount: insertController.recipeData.length,
          itemBuilder: (context, index) {
            var recipe = insertController.recipeData[index];
            String recipeId = recipe['key'].toString();

            return Dismissible(
              key: Key(recipeId),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // Remove recipe from the list
                insertController.deleteRecipe(recipe['key']);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${recipe['name']} deleted')),
                );
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 80.0, // Ensure each item has a minimum height
                ),
                child: Draggable(
                  data: recipeId,
                  feedback: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Ensure width is constrained
                      child: buildCardContent(context, recipe),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (dragDetails) {
                    int newIndex = getNewIndex(dragDetails.offset);
                    if (newIndex != index) {
                      insertController.moveRecipe(
                          index, newIndex); // Move the recipe
                    }
                  },
                  child: SizedBox(
                    height: 80.0, // Set a fixed height for the draggable item
                    child: buildCard(context,
                        recipe), // Pass only the content, not the whole card
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget buildCard(BuildContext context, Map<String, dynamic> recipe) {
    return Container(
      // height: 120,
      width: double.infinity, // Ensure the item takes the full available width
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: buildCardContent(context, recipe),
      ),
    );
  }

  Widget buildCardContent(BuildContext context, Map<String, dynamic> recipe) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(
          recipe['name'][0].toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        recipe['name'],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // subtitle: Text(
      //   recipe['details'],
      //   maxLines: 1,
      //   overflow: TextOverflow.ellipsis,
      //   style: TextStyle(color: Colors.grey[600]),
      // ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          insertController.deleteRecipe(recipe['key']);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${recipe['name']} deleted')),
          );
        },
      ),
      onTap: () {
        // Navigate to RecipeDetail page
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
    );
  }
}
