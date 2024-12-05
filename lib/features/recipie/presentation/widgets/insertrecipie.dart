import 'package:cookapp/features/recipie/presentation/widgets/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:cookapp/controllers/app_controller.dart';
import 'package:get/get.dart';

class RecipeInsert extends StatelessWidget {
  RecipeInsert({super.key});

  final nameEditing = TextEditingController();
  final detailEditing = TextEditingController();
  final InsertController insertController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameEditing,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: detailEditing,
              maxLines: 10,
              decoration: InputDecoration(labelText: 'Recipe Details'),
            ),
            SizedBox(height: 20),
            Actionbutton(
              text: 'Save Recipe',
              nameEditing: nameEditing,
              detailEditing: detailEditing,
            ),
          ],
        ),
      ),
    );
  }
}
