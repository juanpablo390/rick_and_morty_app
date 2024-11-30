import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';

class GetAllCharactersAvoritesUseCase {
  final CharactersRepository repository;

  GetAllCharactersAvoritesUseCase({required this.repository});
  Future<List<Character>> call() {
    return repository.getAllCharactersFavorites();
  }
}
