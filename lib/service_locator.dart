import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/features/character/data/datasources/character_local_data_sources.dart';
import 'package:rick_and_morty_app/features/character/data/datasources/character_remote_data_sources.dart';
import 'package:rick_and_morty_app/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/add_to_favorite.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/get_all_characters_favorites.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/get_characters.dart';
import 'package:rick_and_morty_app/features/character/domain/use_cases/remove_favorite.dart';
import 'package:rick_and_morty_app/features/character/presentation/store/character_store.dart';

final sl = GetIt.instance;

void setupLocator() {

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(() => CharacterRemoteDataSourcesImpl());
  sl.registerLazySingleton<CharacterLocalDataSource>(() => HiveCharacterLocalDataSourceImpl());

  // Repositorio
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSources: sl<CharacterRemoteDataSource>(),
      localDataSource: sl<CharacterLocalDataSource>(),
    ),
  );

  // Casos de uso
  sl.registerFactory<AddToFavoriteUseCase>(() => AddToFavoriteUseCase(repository: sl<CharacterRepository>()));
  sl.registerFactory<GetAllCharactersFavoritesUseCase>(() =>GetAllCharactersFavoritesUseCase(repository: sl<CharacterRepository>()));
  sl.registerFactory<GetCharactersUseCase>(() => GetCharactersUseCase(repository: sl<CharacterRepository>()));
  sl.registerFactory<RemoveFavoriteUseCase>(() => RemoveFavoriteUseCase(repository: sl<CharacterRepository>()));

  // Store
  sl.registerLazySingleton<CharacterStore>(() => CharacterStore(
        getCharactersUseCase: sl<GetCharactersUseCase>(),
        getAllCharactersFavoritesUseCase: sl<GetAllCharactersFavoritesUseCase>(),
        addToFavoriteUseCase: sl<AddToFavoriteUseCase>(),
        removeFavoriteUseCase: sl<RemoveFavoriteUseCase>(),
      ));
}
