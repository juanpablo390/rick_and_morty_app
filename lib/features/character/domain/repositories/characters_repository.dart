import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters(int page);
  Future<bool> addToFavorite(Character character);
  Future<bool> removeFavorite(Character character);
  Future<List<Character>> getAllCharactersFavorites();
}
