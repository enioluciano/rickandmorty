import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';
import 'package:projetorickmorty/app/modules/character/domain/usecases/get_list_character.dart';
import 'package:projetorickmorty/app/modules/core/mixin/loader_mixin.dart';
part 'characters_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  final GetListCharacter getListCharacter;
  _CharacterStore(this.getListCharacter);

  void load() {
    Loader.show();
  }

  @observable
  bool loading = false;

  @observable
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  Future listCharacter() async {
    Loader.show();
    final result = await getListCharacter.call();
    result.fold((failure) {
      Loader.hide();
      // print(failure.erroMessage);
      print('falhou');
    }, (success) {
      Loader.hide();
      log('SUCESSO!');
      _characters = success;
    });
  }
}
