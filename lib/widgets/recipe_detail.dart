// recipe_detail.dart
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String title;
  final String image;
  final String rating;
  final String time;
  final String views;

  const RecipeDetail({super.key, 
    required this.title,
    required this.image,
    required this.rating,
    required this.time,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text(rating),
                Spacer(),
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 5),
                Text(time),
              ],
            ),
            SizedBox(height: 10),
            Text("Views: $views"),
          ],
        ),
      ),
    );
  }
}
