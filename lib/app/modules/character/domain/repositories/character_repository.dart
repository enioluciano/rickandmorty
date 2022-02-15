import 'package:dartz/dartz.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';
import 'package:projetorickmorty/app/modules/core/errors/failures.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getListCharacter();
}
