import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/article.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());

  // Ouvrir la boîte Hive
  final articlesBox = await Hive.openBox<Article>('articles');

  // Remplir la boîte avec des données si elle est vide
  if (articlesBox.isEmpty) {
    _populateArticles(articlesBox);
  }

  runApp(MyApp());
}

void _populateArticles(Box<Article> box) {
  final articles = [
    Article(
      id: 1,
      title: "Introduction à la Fonction Publique",
      content:
          "La fonction publique est essentielle pour le bon fonctionnement de l'État.",
    ),
    Article(
      id: 2,
      title: "Les droits des fonctionnaires",
      content:
          "Les fonctionnaires jouissent de droits fondamentaux, tels que le droit à la rémunération et à la sécurité d'emploi.",
    ),
    Article(
      id: 3,
      title: "Les obligations des fonctionnaires",
      content:
          "Les fonctionnaires doivent respecter les principes de neutralité et de discrétion professionnelle.",
    ),
    Article(
      id: 4,
      title: "Le recrutement dans la Fonction Publique",
      content:
          "Le recrutement se fait par concours pour garantir l'égalité des chances.",
    ),
    Article(
      id: 5,
      title: "Les sanctions disciplinaires",
      content:
          "Des sanctions peuvent être prises en cas de manquement aux obligations professionnelles.",
    ),
  ];

  for (var article in articles) {
    box.put(article.id, article);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niger Fonction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
