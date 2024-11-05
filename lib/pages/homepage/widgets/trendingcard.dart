import 'package:flutter/material.dart';

class Trendingcards extends StatelessWidget {
  final String imageUrl;
  // final String time;
  final String title;
  // final String author;

  const Trendingcards({
    super.key,
    required this.imageUrl,
    // required this.time,
    required this.title,
    // required this.author
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      padding: EdgeInsets.all(15),
      // height: 300,
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
              child: Image.network(
                // 'https://www.cosmeticsdesign-asia.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/cosmetics/cosmeticsdesign-asia.com/headlines/market-trends/hot-topics-top-5-trending-beauty-and-cosmetics-news-stories-on-social-media13/10650793-1-eng-GB/Hot-Topics-Top-5-trending-beauty-and-cosmetics-news-stories-on-social-media.jpg',
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          // Text(
          //   tag,
          //   // "Trending no 1",
          //   style: const TextStyle(
          //     fontSize: 12,
          //     color: Colors.white,
          //   ),
          // ),
          // Text(
          //   time,
          //   // "2 days ago",
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: Colors.grey,
          //   ),
          // )
          //   ],
          // ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  // "Top 5 trending beauty and cosmetics news stories on social media",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    // color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 5,
          //     ),
          //     CircleAvatar(
          //       radius: 15,
          //       backgroundColor: Theme.of(context).colorScheme.primary,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       author,
          //       // "kumar",
          //       maxLines: 2,
          //       style: TextStyle(
          //         fontSize: 15,
          //         // color: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
