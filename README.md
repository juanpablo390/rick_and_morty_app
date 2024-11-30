# rick_and_morty_app

A new Flutter project.

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

### Decisiones Técnicas

- Clean Architecture: Se eligió esta arquitectura para mejorar la mantenibilidad y escalabilidad del proyecto, permitiendo que cada capa se encargue de una responsabilidad específica.

- MobX: Se utilizó MobX para la gestión del estado debido a su enfoque reactivo, lo que facilita la actualización de la UI cada vez que el estado cambia. Esto es ideal para aplicaciones que requieren manejar estados complejos como las listas de personajes y favoritos.

- Get_it: Se utilizó Get_it como un servicio de inyección de dependencias para facilitar el acceso global a las instancias de las clases, como CharacterStore, sin acoplar directamente las clases entre sí.

- HTTP: Se utiliza el paquete http para realizar solicitudes a la API de Rick and Morty, facilitando la obtención de datos sobre los personajes.

- Hive: Hive se empleó para persistir los personajes favoritos localmente. Es una base de datos rápida y ligera que se integra fácilmente con Flutter.

- flutter_hive: Se utilizó flutter_hive como puente entre Hive y Flutter, permitiendo una fácil integración de la base de datos en la aplicación.

- flutter_map: flutter_map se utilizó para implementar el mapa interactivo. Este paquete es ligero y personalizable, permitiendo agregar marcadores y gestionar la visualización de mapas en Flutter.

- latlong2: latlong2 es utilizado para definir las coordenadas geográficas de los marcadores en el mapa, permitiendo especificar las ubicaciones de Valledupar y Bogotá.

## Pasos de instalación

- Clona el repositorio en tu máquina local:

```javascript
git clone https://github.com/juanpablo390/rick_and_morty_app.git
cd rick_and_morty_app
```
- Instala las dependencias:

```
flutter pub get
```

- Ejecuta la aplicación en un emulador o dispositivo físico:

```
flutter run
```