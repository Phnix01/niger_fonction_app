import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/article.dart';

class ArticleDetailScreen extends StatefulWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affichage du contenu de l'article
            Text(
              widget.article.content,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),

            // Actions interactives
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bouton pour marquer l'article comme favori
                IconButton(
                  icon: Icon(
                    widget.article.isFavorite ? Icons.star : Icons.star_border,
                    color:
                        widget.article.isFavorite ? Colors.yellow : Colors.grey,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      // Mettre à jour l'état du favori
                      widget.article.isFavorite = !widget.article.isFavorite;

                      // Sauvegarder dans Hive
                      Hive.box<Article>('articles')
                          .put(widget.article.id, widget.article);
                    });
                  },
                ),
                // Bouton pour prendre une note (fonctionnalité future)
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Prendre une note est à venir !"),
                      ),
                    );
                  },
                  child: Text("Prendre une note"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
