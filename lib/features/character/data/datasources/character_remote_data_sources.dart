import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

abstract class CharacterRemoteDataSources {
  Future<List<CharacterModel>> getCharacters();
}

class CharacterRemoteDataSourcesImpl implements CharacterRemoteDataSources {
  final http.Client client = http.Client();

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final response = await client
        .get(Uri.parse('https://rickandmortyapi.com/api/character/'));

    return (response.body as Map<String, dynamic>)['results'].map((e) => CharacterModel.fromJson(e)).toList();
  }
}
