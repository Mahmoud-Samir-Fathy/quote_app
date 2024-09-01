import '../../domain/entities/quote.dart';

class QuoteModel extends Quote{

  const QuoteModel({
    required int id,
    required String author,
    required String content,
    required List<String> tags,
    required String authorSlug,
    required int length,
    required DateTime dateAdded,
    required DateTime dateModified}):
        super(
      id: id,
      author: author,
      content: content,
      tags: tags,
      authorSlug: authorSlug,
      length: length,
      dateAdded: dateAdded,
      dateModified: dateModified
  );



  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    id: json["id"] ?? 0,
    author: json["author"] ?? '',
    content: json["content"] ?? '',
    tags: List<String>.from(json["tags"]?.map((x) => x) ?? []),
    authorSlug: json["authorSlug"] ?? '',
    length: json["length"] ?? 0,
    dateAdded: DateTime.parse(json["dateAdded"] ?? DateTime.now().toIso8601String()),
    dateModified: DateTime.parse(json["dateModified"] ?? DateTime.now().toIso8601String()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "content": content,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };

}