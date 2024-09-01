import 'package:equatable/equatable.dart';

class Quote extends Equatable{
  final int id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final DateTime dateAdded;
  final DateTime dateModified;

  const Quote({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });
  @override
  List<Object?> get props => [id,author,content,tags,authorSlug,length,dateAdded,dateModified];
}