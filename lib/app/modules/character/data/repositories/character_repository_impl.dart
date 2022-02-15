import 'package:projetorickmorty/app/modules/character/data/datasource/character_datasource.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';
import 'package:dartz/dartz.dart';
import 'package:projetorickmorty/app/modules/character/domain/errors/character_failures.dart';
import 'package:projetorickmorty/app/modules/character/domain/repositories/character_repository.dart';
import 'package:projetorickmorty/app/modules/core/errors/failures.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterDatasource datasource;
  CharacterRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<Character>>> getListCharacter() async {
    try {
      final result = await datasource.getListCharacter();
      if (result.isEmpty) {
        return Left(NotFound());
      }
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
