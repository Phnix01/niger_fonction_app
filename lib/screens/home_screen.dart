import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/article.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articlesBox = Hive.box<Article>('articles');
    final articles = articlesBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Niger Fonction'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            title: Text(article.title),
            subtitle: Text(article.content.substring(0, 50) + '...'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
