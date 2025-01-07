import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int articleId;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime createdAt;

  Note({
    required this.id,
    required this.articleId,
    required this.content,
    required this.createdAt,
  });
}
