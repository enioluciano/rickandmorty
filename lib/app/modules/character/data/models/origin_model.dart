import 'package:projetorickmorty/app/modules/character/domain/entities/origin.dart';

class OriginModel extends Origin {
  OriginModel({
    String? name,
    String? url,
  }) : super(name: name, url: url);

  OriginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
