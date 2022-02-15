import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projetorickmorty/app/modules/character/data/datasource/character_datasource_impl.dart';
import 'package:projetorickmorty/app/modules/character/domain/errors/character_failures.dart';
import 'package:projetorickmorty/app/modules/core/errors/failures.dart';

import '../../../services/dio.mocks.dart';
import '../../../services/dioo.mocks.dart' as d;
import '../../../util/fixture.dart';

void main() {
  final dio = MockDioService();
  final dioo = d.MockDio();
  final datasource = CharacterDatasourceImpl(dio: dioo);

  group('Testar o método getListCharacter da classe CharacterDatasourceImpl',
      () {
    final options = RequestOptions(path: '');

    test('Quando o status da requisição for 200', () async {
      final body = json.decode(fixture('results.json'));
      when(dioo.get(any)).thenAnswer((_) async => Response(
          requestOptions: options, statusCode: HttpStatus.ok, data: body));
      final future = datasource.getListCharacter();
      expect(future, completes);
    });

    test('Quando o DioErrorType resultar em OTHERS ', () {
      when(dioo.get(any)).thenThrow(
          DioError(requestOptions: options, type: DioErrorType.other));

      final future = datasource.getListCharacter();
      expect(future, throwsA(isA<GetListCharacterError>()));
    });

    test('Quando o DioErrorType resultar em TIME OUT', () {
      when(dioo.get(any)).thenThrow(
          DioError(requestOptions: options, type: DioErrorType.connectTimeout));

      final future = datasource.getListCharacter();
      expect(future, throwsA(isA<GetListCharacterNoInternetConnection>()));
    });

    test('Quando o DioErrorType resultar em RESPONSE', () {
      when(dioo.get(any)).thenThrow(DioError(
        requestOptions: options,
        type: DioErrorType.response,
        response: Response(requestOptions: options, statusCode: 402),
      ));

      final future = datasource.getListCharacter();
      expect(future, throwsA(isA<GetListCharacterError>()));
    });
  });
}
