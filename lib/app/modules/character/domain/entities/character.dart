import 'package:projetorickmorty/app/modules/character/data/models/origin_model.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/origin.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  OriginModel? origin;
  OriginModel? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});
}
