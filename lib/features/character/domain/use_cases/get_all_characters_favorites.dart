import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';

class GetAllCharactersFavoritesUseCase {
  final CharacterRepository repository;

  GetAllCharactersFavoritesUseCase({required this.repository});
  Future<List<Character>> call() {
    return repository.getAllCharactersFavorites();
  }
}
