import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:niger_fonction_app/models/article.dart';
import 'package:niger_fonction_app/models/note.dart';

void main() async {
  // initialisation de hive
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(NoteAdapter());

  // ouverture des box
  Hive.openBox<Article>('articles');
  Hive.openBox<Note>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
