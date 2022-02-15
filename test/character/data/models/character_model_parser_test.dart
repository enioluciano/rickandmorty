import 'package:flutter_test/flutter_test.dart';
import 'package:projetorickmorty/app/modules/character/data/models/character_model.dart';

import '../../../util/json_character.dart';

void main() {
  final data = response['results'];

  group('Character model parser test', () {
    test('não deve retornar nulo', () {
      List character = data.map((e) => CharacterModel.fromJson(e)).toList();
      expect(character, isNotNull);
      expect(character, isA<List>());
    });
  });
}
