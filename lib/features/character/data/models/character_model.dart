import 'package:rick_and_morty_app/features/character/domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CharacterModel.fromEntity(Character character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      image: character.image,
    );
  }

}
