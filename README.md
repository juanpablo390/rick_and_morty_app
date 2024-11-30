# rick_and_morty_app

A new Flutter project.

# Instalación y Ejecución

### Requisitos previos

Asegúrate de tener los siguientes programas instalados:

- Flutter (para compilar la app): Instalación de Flutter
- Dart SDK (automáticamente instalado con Flutter)
- Android Studio o Visual Studio Code (para desarrollar y ejecutar la app)
- Emulador Android o dispositivo físico conectado

### Arquitectura
La aplicación sigue la Clean Architecture, lo que permite una separación clara de responsabilidades y facilita la escalabilidad. La estructura del proyecto está dividida en tres capas principales:

#### Capa de Presentación:

- Se encarga de la interfaz de usuario.
- Se utilizan Widgets y MobX para manejar el estado de la aplicación de forma reactiva.
- Las pantallas incluyen: CharactersPage, CharacterDetailPage y FavoritesPage.

#### Capa de Dominio:

- Contiene los casos de uso que gestionan la lógica de negocio de la aplicación.
- Incluye: GetCharactersUseCase, AddToFavoriteUseCase, GetAllCharactersFavoritesUseCase, etc.

#### Capa de Datos:

- Encargada de la comunicación con la API externa de Rick and Morty.
- Utiliza un repositorio para abstraer la lógica de acceso a los datos.
- Realiza peticiones HTTP a la API de Rick and Morty para obtener los personajes.




[online documentation](https://docs.flutter.dev/)
