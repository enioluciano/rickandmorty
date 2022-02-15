import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetorickmorty/app/modules/character/data/datasource/character_datasource.dart';
import 'package:projetorickmorty/app/modules/character/data/datasource/character_datasource_impl.dart';
import 'package:projetorickmorty/app/modules/character/data/repositories/character_repository_impl.dart';
import 'package:projetorickmorty/app/modules/character/domain/repositories/character_repository.dart';
import 'package:projetorickmorty/app/modules/character/domain/usecases/get_list_character.dart';
import 'package:projetorickmorty/app/modules/character/presentation/screens/characters/characters_page.dart';
import 'package:projetorickmorty/app/modules/character/presentation/stores/characters_store.dart';
import 'package:projetorickmorty/app/services/configuration.dart';
import 'package:projetorickmorty/app/services/dio.dart';

class CharacterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Dio>((i) {
      final dio = Dio(BaseOptions(
          connectTimeout: 30000,
          baseUrl: AppConfigs.urlBackend,
          receiveTimeout: 30000,
          sendTimeout: 30000,
          validateStatus: (code) => code! < HttpStatus.internalServerError));
      return dio;
    }),
    Bind<CharacterDatasource>(
        (i) => CharacterDatasourceImpl(dio: i.get<Dio>())),
    Bind<CharacterRepository>(
        (i) => CharacterRepositoryImpl(datasource: i<CharacterDatasource>())),
    Bind.singleton<GetListCharacter>(
        (i) => GetListCharacterImpl(repository: i<CharacterRepository>())),
    Bind((i) => CharacterStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CharactersPages()),
  ];
}
