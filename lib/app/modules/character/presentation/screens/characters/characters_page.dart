import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetorickmorty/app/modules/character/domain/entities/character.dart';
import 'package:projetorickmorty/app/modules/character/presentation/stores/characters_store.dart';
import 'package:projetorickmorty/app/modules/core/mixin/loader_mixin.dart';

class CharactersPages extends StatefulWidget {
  const CharactersPages({Key? key}) : super(key: key);

  @override
  _CharactersPagesState createState() => _CharactersPagesState();
}

class _CharactersPagesState extends State<CharactersPages> {
  final CharacterStore _store = Modular.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Add Your Code here.
      _store.listCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Loader.show();
                },
                icon: Icon(
                  Icons.access_alarm,
                  color: Colors.black,
                ))
          ],
        ),
        body: Observer(builder: (_) {
          return ListView.builder(
              itemCount: _store.characters.length,
              itemBuilder: (context, index) {
                Character char = _store.characters[index];
                return Column(
                  children: [
                    Text(char.name!),
                    Image.network(char.image!),
                    Text(char.status!)
                  ],
                );
              });
        }));
  }
}
