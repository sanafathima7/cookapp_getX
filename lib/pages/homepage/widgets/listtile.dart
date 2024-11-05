import 'package:cookapp/pages/bookmarkpage/widgets/insertrecipie.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
      required this.imageUrl,
      required this.time,
      required this.title,
      required this.author,
      required this.fun});
  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => fun(), // Call fun() to get the Widget
            ),
          );
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
          left: 10,
          top: 10,
        ),
        padding: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        author,
                        // 'India Now'
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 10,
                    ),
                    child: Text(
                      maxLines: 2,
                      title,
                      // "No budget-friendly Galaxy Z Fold in sight, confirms Samsung"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.timer_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          // '2 days ago',
                          time,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
