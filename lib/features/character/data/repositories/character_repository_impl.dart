import 'package:rick_and_morty_app/features/character/data/datasources/character_local_data_sources.dart';
import 'package:rick_and_morty_app/features/character/data/datasources/character_remote_data_sources.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSources;
  final CharacterLocalDataSource localDataSource;

  CharacterRepositoryImpl(
      {required this.remoteDataSources, required this.localDataSource});

  @override
  Future<bool> addToFavorite(Character character) async {
    try {
      final bool resp = await localDataSource
          .addToFavorite(CharacterModel.fromEntity(character));
      return resp;
    } catch (error) {
      throw Exception('Error al agregar al favorito (local)');
    }
  }

  @override
  Future<List<Character>> getAllCharactersFavorites() async {
    try {
      final List<CharacterModel> resp =
          await localDataSource.getAllCharactersFavorites();
      return resp;
    } catch (error) {
      throw Exception('Error al traer los favoritos (local)');
    }
  }

  @override
  Future<List<Character>> getCharacters() async {
    try {
      final List<CharacterModel> resp = await remoteDataSources.getCharacters();
      return resp;
    } catch (error) {
      throw Exception('Error al traer los personaje (server data-repository)');
    }
  }

  @override
  Future<bool> removeFavorite(Character character) async {
    try {
      final bool resp = await localDataSource
          .removeFavorite(CharacterModel.fromEntity(character));
      return resp;
    } catch (error) {
      throw Exception('Error al remover favorito (local)');
    }
  }
}
