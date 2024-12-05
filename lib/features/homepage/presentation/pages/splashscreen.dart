import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookapp/pages/homepage/homepage.dart'; // Import Homepage, not Homepagecontroller
import 'package:cookapp/pages/homepage/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();

    // Navigate to the Homepage after the animation completes
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Ensure that SplashScreen is still mounted before navigating
        Get.off(() => const Homepagecontroller());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 111, 60, 141), // Start color
              Colors.purpleAccent, // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimationLimiter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://png.pngtree.com/background/20230528/original/pngtree-chef-arranging-food-on-a-plate-picture-image_2782564.jpg',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) {
                      print("Error loading image: $error");
                      return const Center(
                        child: Text(
                          'Error loading image',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 20),
                AnimationConfiguration.staggeredGrid(
                  position: 1,
                  duration: const Duration(seconds: 1),
                  columnCount: 1,
                  child: FadeInAnimation(
                    child: const Text(
                      'Delicious Recipes',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredGrid(
                  position: 2,
                  duration: const Duration(seconds: 1),
                  columnCount: 1,
                  child: FadeInAnimation(
                    child: const Text(
                      'Cook, Enjoy, and Share!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
