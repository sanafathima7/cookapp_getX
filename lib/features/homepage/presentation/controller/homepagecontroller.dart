import 'package:cookapp/components/bottomnav.dart';
import 'package:cookapp/controllers/bottomnavcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      floatingActionButton: MyBottomnav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
