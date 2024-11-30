import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
}

class CharacterRemoteDataSourcesImpl implements CharacterRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    
    final response = await client
        .get(Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));

    if (response.statusCode != 200) {
      throw Exception('Error al traer los personajes (server api)');
    }

    final resp = jsonDecode(response.body);

    return (resp['results'] as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
  }
}
