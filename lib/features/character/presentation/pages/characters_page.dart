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
  late final CharacterStore characterStore;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    characterStore = sl<CharacterStore>();
    characterStore.fetchCharacters();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        characterStore.hasMorePages &&
        !characterStore.isLoading) {
      characterStore.fetchCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Observer(
        builder: (_) {
          if (characterStore.isLoading && characterStore.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (characterStore.characters.isEmpty) {
            return const Center(child: Text('No se encontraron personajes.'));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: characterStore.characters.length +
                (characterStore.hasMorePages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == characterStore.characters.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final character = characterStore.characters[index];

              return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(character.name),
                  leading: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
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
                        characterStore.removeFromFavorites(character);
                      } else {
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
          const SizedBox(width: 20),
          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
            },
            tooltip: 'Ver Mapa',
            child: const Icon(Icons.map),
          ),
        ],
      ),
    );
  }
}
