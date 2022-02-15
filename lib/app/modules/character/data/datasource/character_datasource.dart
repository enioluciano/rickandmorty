import 'package:projetorickmorty/app/modules/character/data/models/character_model.dart';

abstract class CharacterDatasource {
  Future<List<CharacterModel>> getListCharacter();
}
