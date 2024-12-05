import 'package:cookapp/pages/homepage/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RECIPE'),
        leading: IconButton(
          onPressed: () {
            // Navigate using GetX
            Get.to(() => const Homepagecontroller());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add favorite functionality here
        },
        child: const Icon(Icons.favorite),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Brussels Sprouts Recipe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "By Kumar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://www.simplyrecipes.com/thmb/OBGcZ4gHn-hQyWqTMwkplXJs5NA=/300x200/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/simply-recipes-wine-chicken-lead-1-3-f1fa691b728e4afca42f34d5a0d081ac.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Let’s talk about these roasty, sweet, nutty Brussels sprouts that combine tender-crisp bites with ultra-thin, crispy leaves, coated in mustard-maple sauce and speckled with cranberries. We make these all the time, and they’re a hit with everyone – even guests. If you’re cooking for more than a few people, definitely double the recipe!",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Ingredients:\n- Brussels sprouts\n- Walnuts\n- Dried cranberries\n- Maple syrup\n- Dijon mustard\n- Olive oil, salt, and pepper",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Instructions:\n1. Prep your Brussels sprouts by trimming and halving them.\n2. Toss with olive oil and roast cut-side down until crispy.\n3. Add walnuts for the last minute of roasting.\n4. Mix in cranberries while cooling.\n5. Add Dijon mustard and maple syrup directly to the pan, along with extra olive oil, salt, and pepper. Enjoy!",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
