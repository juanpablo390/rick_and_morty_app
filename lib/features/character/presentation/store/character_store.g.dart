// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStoreBase, Store {
  late final _$charactersAtom =
      Atom(name: '_CharacterStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$favoriteCharactersAtom =
      Atom(name: '_CharacterStoreBase.favoriteCharacters', context: context);

  @override
  ObservableList<Character> get favoriteCharacters {
    _$favoriteCharactersAtom.reportRead();
    return super.favoriteCharacters;
  }

  @override
  set favoriteCharacters(ObservableList<Character> value) {
    _$favoriteCharactersAtom.reportWrite(value, super.favoriteCharacters, () {
      super.favoriteCharacters = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CharacterStoreBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$hasMorePagesAtom =
      Atom(name: '_CharacterStoreBase.hasMorePages', context: context);

  @override
  bool get hasMorePages {
    _$hasMorePagesAtom.reportRead();
    return super.hasMorePages;
  }

  @override
  set hasMorePages(bool value) {
    _$hasMorePagesAtom.reportWrite(value, super.hasMorePages, () {
      super.hasMorePages = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterStoreBase.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters({bool reset = false}) {
    return _$fetchCharactersAsyncAction
        .run(() => super.fetchCharacters(reset: reset));
  }

  late final _$fetchFavoriteCharactersAsyncAction = AsyncAction(
      '_CharacterStoreBase.fetchFavoriteCharacters',
      context: context);

  @override
  Future<void> fetchFavoriteCharacters() {
    return _$fetchFavoriteCharactersAsyncAction
        .run(() => super.fetchFavoriteCharacters());
  }

  late final _$addToFavoritesAsyncAction =
      AsyncAction('_CharacterStoreBase.addToFavorites', context: context);

  @override
  Future<void> addToFavorites(Character character) {
    return _$addToFavoritesAsyncAction
        .run(() => super.addToFavorites(character));
  }

  late final _$removeFromFavoritesAsyncAction =
      AsyncAction('_CharacterStoreBase.removeFromFavorites', context: context);

  @override
  Future<void> removeFromFavorites(Character character) {
    return _$removeFromFavoritesAsyncAction
        .run(() => super.removeFromFavorites(character));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
favoriteCharacters: ${favoriteCharacters},
isLoading: ${isLoading},
currentPage: ${currentPage},
hasMorePages: ${hasMorePages}
    ''';
  }
}
