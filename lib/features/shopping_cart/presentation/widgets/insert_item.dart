import 'package:cookapp/features/shopping_cart/presentation/getX/item_controller.dart';
import 'package:cookapp/features/shopping_cart/presentation/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemInsert extends StatelessWidget {
  ItemInsert({super.key});

  final TextEditingController itemEditing = TextEditingController();
  final ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Item')),

      // Wrap with Scaffold to ensure Material context
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Ensure the content is scrollable
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjusts for BottomSheet
            children: [
              TextFormField(
                controller: itemEditing,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              const SizedBox(height: 20),
              ActionbuttonItem(
                text: 'Save',
                nameEditing: itemEditing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to show the Bottom Sheet
void showItemInsert(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ItemInsert();
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    isScrollControlled: true, // Allow BottomSheet to be scrollable
  );
}
