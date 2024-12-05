import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
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
