import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<bool> addToFavorite(CharacterModel characterModel);
  Future<List<CharacterModel>> getAllCharactersFavorites();
}

class HiveCharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  HiveCharacterLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> addToFavorite(CharacterModel characterModel) async {
    try {
      Box<CharacterModel> box = await Hive.openBox('characters');
      box.add(characterModel);

      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw Exception('Error al agregar al favorito');
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharactersFavorites() async {
    try {
      Box<dynamic> box = await Hive.openBox('characters');

      return box.values.map((c) => CharacterModel.fromJson(c)).toList();
    } catch (error) {
      debugPrint(error.toString());
      throw Exception('Error al traer los favoritos');
    }
  }
}
