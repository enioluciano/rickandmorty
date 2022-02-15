import 'package:dartz/dartz.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';
import 'package:projetorickmorty/app/modules/character/domain/repositories/character_repository.dart';
import 'package:projetorickmorty/app/modules/core/errors/failures.dart';

abstract class GetListCharacter {
  Future<Either<Failure, List<Character>>> call();
}

class GetListCharacterImpl implements GetListCharacter {
  CharacterRepository repository;
  GetListCharacterImpl({required this.repository});
  @override
  Future<Either<Failure, List<Character>>> call() async {
    final result = await repository.getListCharacter();
    return result;
  }
}
