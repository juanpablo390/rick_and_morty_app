import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_app/features/character/presentation/store/character_store.dart';
import 'package:rick_and_morty_app/service_locator.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final characterStore = sl<CharacterStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Observer(
        builder: (_) {
          return characterStore.favoriteCharacters.isEmpty
              ? const Center(child: Text('No tienes personajes favoritos.'))
              : ListView.builder(
                  itemCount: characterStore.favoriteCharacters.length,
                  itemBuilder: (context, index) {
                    final character = characterStore.favoriteCharacters[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(character.name),
                        leading: Image.network(character.image),
                        trailing: IconButton(
                          icon: Observer(
                            builder: (_) {
                              final isFavorite = characterStore
                                  .favoriteCharacters
                                  .contains(character);
                              return Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              );
                            },
                          ),
                          onPressed: () {
                            final isFavorite = characterStore.favoriteCharacters
                                .contains(character);

                            if (isFavorite) {
                              // Eliminar de favoritos
                              characterStore.removeFromFavorites(character);
                            } else {
                              // Agregar a favoritos
                              characterStore.addToFavorites(character);
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
