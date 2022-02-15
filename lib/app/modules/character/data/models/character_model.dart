import 'package:projetorickmorty/app/modules/character/data/models/origin_model.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginModel? origin,
    OriginModel? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) : super(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            episode: episode,
            url: url,
            created: created);

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] != null ? OriginModel.fromJson(json['origin']) : null;
    location = json['location'] != null
        ? OriginModel.fromJson(json['location'])
        : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}
