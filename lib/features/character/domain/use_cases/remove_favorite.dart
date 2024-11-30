import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';

class RemoveFavoriteUseCase {
  final CharacterRepository repository;

  RemoveFavoriteUseCase({required this.repository});

  Future<bool> call(Character character) {

    return repository.removeFavorite(character);

  }
}