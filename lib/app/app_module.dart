import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetorickmorty/app/modules/character/character_module.dart';
import 'package:projetorickmorty/app/services/dio.dart';

class AppModuleModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: CharacterModule()),
  ];
}
