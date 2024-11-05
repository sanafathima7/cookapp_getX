import 'package:cookapp/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Actionbutton extends StatelessWidget {
  Actionbutton({
    super.key,
    required this.text,
    required this.nameEditing,
    required this.detailEditing,
  });

  final String text;
  final TextEditingController nameEditing;
  final TextEditingController detailEditing;
  final InsertController insertController = Get.put(InsertController());

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
                  insertController.addRecipe(
                    nameEditing.text,
                    detailEditing.text,
                  );

                  // Optionally clear the text fields after saving
                  nameEditing.clear();
                  detailEditing.clear();
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
