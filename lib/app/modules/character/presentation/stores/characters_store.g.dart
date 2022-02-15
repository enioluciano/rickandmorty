// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterStore on _CharacterStore, Store {
  final _$loadingAtom = Atom(name: '_CharacterStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_charactersAtom = Atom(name: '_CharacterStore._characters');

  @override
  List<Character> get _characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  set _characters(List<Character> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
