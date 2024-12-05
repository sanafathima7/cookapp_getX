import 'package:cookapp/controllers/bottomnavcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomnav extends StatelessWidget {
  const MyBottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // 90% width of screen
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 111, 60, 141),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                controller.index.value = 0;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: controller.index.value == 0
                        ? const Color.fromARGB(255, 219, 197, 118)
                        : null,
                  ),
                  child: const Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                    // color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 1;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: controller.index.value == 1
                        ? const Color.fromARGB(255, 219, 197, 118)
                        : null,
                  ),
                  child: Icon(
                    size: 30,
                    Icons.book,
                    color: Colors.white70,
                    // color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 2;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: controller.index.value == 2
                        ? const Color.fromARGB(255, 219, 197, 118)
                        : null,
                  ),
                  child: Icon(
                    size: 30,
                    Icons.favorite,
                    color: Colors.white70,
                    // color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 3;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: controller.index.value == 3
                        ? const Color.fromARGB(255, 219, 197, 118)
                        : null,
                  ),
                  child: Icon(
                    size: 30,
                    Icons.shopping_bag,
                    color: Colors.white70,
                    // color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
