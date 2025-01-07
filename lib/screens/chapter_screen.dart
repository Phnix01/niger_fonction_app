import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_detail_screen.dart';

class ChaptersScreen extends StatelessWidget {
  final Article article;

  ChaptersScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.content,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                );
              },
              child: Text("Voir les détails"),
            ),
          ],
        ),
      ),
    );
  }
}
