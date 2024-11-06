import 'package:cookapp/controllers/item_controller.dart';
import 'package:cookapp/pages/bookmarkpage/recipiedetail.dart';
import 'package:cookapp/pages/shopping_cart/widget/insert_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookapp/controllers/app_controller.dart';
import 'package:cookapp/pages/bookmarkpage/widgets/insertrecipie.dart';

class ShoppingBag extends StatelessWidget {
  ShoppingBag({super.key});
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 60, 141),
        title: const Text(
          'shopping bag',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ItemInsert()),
              // );
              Get.to(() =>
                  ItemInsert()); // Use Get.to() instead of Navigator.push()
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
          itemCount: itemController.ItemData.length,
          itemBuilder: (context, index) {
            final item = itemController.ItemData[index];
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
                    item['item'][0]
                        .toUpperCase(), // Display first letter of recipe name
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  item['item'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                trailing: IconButton(
                  onPressed: () {
                    itemController.deleteitem(item['key']);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => RecipeDetailPage(
                //         recipeKey: recipe['key'],
                //         recipeName: recipe['item'],
                //         recipeDetails: recipe[
                //             'details'], // Pass the actual recipe details here
                //       ),
                //     ),
                //   );
                // },
              ),
            );
          },
        );
      }),
    );
  }
}
