import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Trendingcards extends StatelessWidget {
  final String imageUrl;
  final String title;

  const Trendingcards({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(15),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) {
                  // Log the error to the console
                  print("Error loading image: $error");

                  // Return a Text widget instead of an Icon
                  return Center(
                    child: Text(
                      'Error loading image $error',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
