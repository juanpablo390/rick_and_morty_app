import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/add_to_favorite.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/get_all_characters_favorites.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/get_characters.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/remove_favorite.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  final GetCharactersUseCase getCharactersUseCase;
  final GetAllCharactersFavoritesUseCase getAllCharactersFavoritesUseCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  _CharacterStoreBase({
    required this.getCharactersUseCase,
    required this.getAllCharactersFavoritesUseCase,
    required this.addToFavoriteUseCase,
    required this.removeFavoriteUseCase,
  });

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  ObservableList<Character> favoriteCharacters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchCharacters() async {
    isLoading = true;
    try {
      final result = await getCharactersUseCase();
      characters.clear();
      characters.addAll(result);
    } catch (e) {
      throw Exception('(store) Error al obtener los personajes: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchFavoriteCharacters() async {
    try {
      favoriteCharacters.clear();
      final result = await getAllCharactersFavoritesUseCase();
      favoriteCharacters.addAll(result);
    } catch (e) {
      throw Exception('Error al obtener los personajes favoritos: $e');
    }
  }

  @action
  Future<void> addToFavorites(Character character) async {
    try {
      final success = await addToFavoriteUseCase(character);
      if (success) {
        favoriteCharacters.add(character);
      }
    } catch (e) {
      throw Exception('Error al agregar a favoritos: $e');
    }
  }

  @action
  Future<void> removeFromFavorites(Character character) async {
    try {
      final success = await removeFavoriteUseCase(character);
      if (success) {
        favoriteCharacters.remove(character);
      }
    } catch (e) {
      throw Exception('Error al remover de favoritos: $e');
    }
  }
}
