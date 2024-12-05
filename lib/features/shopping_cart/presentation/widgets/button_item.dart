import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/features/shopping_cart/presentation/getX/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionbuttonItem extends StatelessWidget {
  ActionbuttonItem({
    super.key,
    required this.text,
    required this.nameEditing,
  });

  final String text;
  final TextEditingController nameEditing;
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  // Call addRecipe to save the name and details
                  itemController.addItem(
                    nameEditing.text,
                  );
                  // Optionally clear the text fields after saving
                  nameEditing.clear();
                },
                child: Center(child: Text(text)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
