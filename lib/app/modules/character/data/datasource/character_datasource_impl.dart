import 'package:dio/dio.dart';
import 'package:projetorickmorty/app/modules/character/data/datasource/character_datasource.dart';
import 'package:projetorickmorty/app/modules/character/data/models/character_model.dart';
import 'package:projetorickmorty/app/modules/character/domain/errors/character_failures.dart';
import 'package:projetorickmorty/app/services/dio.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  Dio dio;
  CharacterDatasourceImpl({required this.dio});
  @override
  Future<List<CharacterModel>> getListCharacter() async {
    try {
      final response = await dio.get('/character');
      final data = response.data['results'];
      List<CharacterModel> characters = data
          .map<CharacterModel>(
              (character) => CharacterModel.fromJson(character))
          .toList();

      return characters;
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.connectTimeout ||
          exception.type == DioErrorType.receiveTimeout) {
        throw GetListCharacterNoInternetConnection();
      }

      if (exception.type == DioErrorType.response) {
        throw GetListCharacterError(
            stackTrace,
            'CharacterDatasourceImpl - getListCharacter',
            exception,
            exception.toString());
      }

      if (exception.type == DioErrorType.other) {
        throw GetListCharacterError(
            stackTrace,
            'CharacterDatasourceImpl - getListCharacter',
            exception,
            exception.toString());
      } else {
        throw GetListCharacterError(
            stackTrace,
            'CharacterDatasourceImpl - getListCharacter',
            exception,
            exception.toString());
      }
    }
  }
}
