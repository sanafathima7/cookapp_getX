import 'package:cookapp/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeEditPage extends StatelessWidget {
  final int recipeKey;
  final TextEditingController nameEditingController;
  final TextEditingController detailsEditingController;
  final InsertController insertController = Get.find();

  RecipeEditPage(
      {required this.recipeKey, required String name, required String details})
      : nameEditingController = TextEditingController(text: name),
        detailsEditingController = TextEditingController(text: details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              insertController.editRecipe(
                recipeKey,
                nameEditingController.text,
                detailsEditingController.text,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameEditingController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            TextField(
              controller: detailsEditingController,
              decoration: InputDecoration(labelText: 'Recipe Details'),
            ),
          ],
        ),
      ),
    );
  }
}
