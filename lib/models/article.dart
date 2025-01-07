import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final bool isFavoite;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.isFavoite,
  });
}
