import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/character/presentation/pages/characters_page.dart';
import 'package:rick_and_morty_app/features/character/presentation/pages/favorite_characters_page.dart';
import 'package:rick_and_morty_app/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      title: 'Rick and Morty App',
      initialRoute: '/',
      routes: {
        '/': (_) => const CharactersPage(),
        '/favorites': (_) => const FavoritesPage(),
      },
    );
  }
}
