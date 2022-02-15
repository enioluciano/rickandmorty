import 'package:projetorickmorty/app/modules/character/domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) : super(count: count, pages: pages, next: next, prev: prev);

  InfoModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() =>
      {'count': count, 'pages': pages, 'next': next, 'prev': prev};
}
