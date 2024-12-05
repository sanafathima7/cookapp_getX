import 'package:cookapp/features/shopping_cart/presentation/getX/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemEditBottomSheet extends StatelessWidget {
  final int itemKey;
  final TextEditingController nameEditingController;
  final ItemController itemController = Get.find();

  ItemEditBottomSheet({required this.itemKey, required String item})
      : nameEditingController = TextEditingController(text: item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimize height to fit content
        children: [
          TextField(
            controller: nameEditingController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.save),
            label: Text('Save'),
            onPressed: () {
              itemController.editItem(itemKey, nameEditingController.text);
              Navigator.pop(context); // Close the bottom sheet
            },
          ),
        ],
      ),
    );
  }
}

// Function to show the Edit Bottom Sheet
void showItemEditBottomSheet(BuildContext context, int itemKey, String item) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ItemEditBottomSheet(itemKey: itemKey, item: item);
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    isScrollControlled: true,
  );
}
