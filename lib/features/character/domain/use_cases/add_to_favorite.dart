import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';

class AddToFavoriteUseCase {
  final CharacterRepository repository;

  AddToFavoriteUseCase({required this.repository});

  Future<bool> call(Character character) {

    return repository.addToFavorite(character);

  }
}
