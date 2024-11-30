import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharacters();
  Future<bool> addToFavorite(Character character);
  Future<List<Character>> getAllCharactersFavorites();
}
