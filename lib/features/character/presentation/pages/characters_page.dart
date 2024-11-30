import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_app/features/character/presentation/pages/map_page.dart';
import 'package:rick_and_morty_app/features/character/presentation/store/character_store.dart';
import 'package:rick_and_morty_app/service_locator.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    super.initState();
    // Llamada a la función fetchCharacters() al iniciar la pantalla.
    final characterStore = sl<CharacterStore>();
    characterStore.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final characterStore = sl<CharacterStore>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Personajes'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Observer(
          builder: (_) {
            if (characterStore.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (characterStore.characters.isEmpty) {
              return const Center(child: Text('No se encontraron personajes.'));
            }

            return ListView.builder(
              itemCount: characterStore.characters.length,
              itemBuilder: (context, index) {
                final character = characterStore.characters[index];

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
                          final isFavorite = characterStore.favoriteCharacters
                              .contains(character);
                          return Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
              tooltip: 'Favoritos',
              child: const Icon(Icons.favorite),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                // Navegar a la página de mapas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
              tooltip: 'Ver Mapa',
              child: const Icon(Icons.map),
            ),
          ],
        ));
  }
}
