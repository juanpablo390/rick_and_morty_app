# rick_and_morty_app

### Requisitos previos

Asegúrate de tener los siguientes programas instalados:

- Flutter (para compilar la app): Instalación de Flutter
- Dart SDK (automáticamente instalado con Flutter)
- Android Studio o Visual Studio Code (para desarrollar y ejecutar la app)
- Emulador Android o dispositivo físico conectado

### Arquitectura
La aplicación sigue la Clean Architecture, lo que permite una separación clara de responsabilidades y facilita la escalabilidad. La estructura del proyecto está dividida en tres capas principales:

#### Capa de Datos

Esta capa se encarga de la interacción directa con las fuentes de datos. Está subdividida en:

- datasources:

    - character_local_data_sources.dart: Maneja la persistencia local de datos (por ejemplo, usando bases de    datos locales como SQLite o SharedPreferences).

    - character_remote_data_sources.dart: Realiza las llamadas a la API remota para obtener información de personajes.

- models:

    - character_model.dart: Define cómo se estructuran los datos que provienen de la API o la base de datos. Es un reflejo de los datos que manejan las fuentes, con métodos como fromJson y toJson para serialización/deserialización.

- repositories:

    - character_repository_impl.dart: Implementa las funciones del repositorio definido en el dominio. Actúa como un puente entre las fuentes de datos (datasources) y la capa de dominio.

#### Capa de Dominio:

La capa dominio contiene la lógica central de la aplicación, independiente de cualquier tecnología específica.

- entities:

    - character.dart: Define las entidades principales de la app, como los personajes. Estas entidades son modelos simplificados, libres de detalles específicos de implementación.

- repositories:

    - characters_repository.dart: Es una interfaz que define las operaciones permitidas sobre los datos (p. ej., obtener personajes, agregar favoritos). Es implementada por character_repository_impl.dart en la capa de datos.

- use_cases:

    - add_to_favorite.dart: Contiene la lógica específica para añadir un personaje a favoritos.
    - get_all_characters_favorites.dart: Devuelve todos los personajes marcados como favoritos.
    - get_characters.dart: Se encarga de la lógica para obtener los personajes desde la API o el almacenamiento local.
    - remove_favorite.dart: Gestiona la eliminación de un personaje de favoritos.

#### Capa de Dominio:

La capa de presentación gestiona la interacción con el usuario y muestra los datos.

- pages:

    - characters_page.dart: Página principal donde se muestra la lista de personajes.
    - favorite_characters_page.dart: Página que muestra los personajes marcados como favoritos.
    - map_page.dart: Página destinada a mostrar un mapa (posiblemente para ubicaciones relacionadas con los personajes).

- store:

    - character_store.dart: Contiene el estado observable de la app (usando MobX). Gestiona las acciones como la carga de personajes y la gestión de favoritos.
    - character_store.g.dart: Archivo generado automáticamente por MobX para gestionar las anotaciones y la reactividad.

- widgets:

    - Probablemente contenga componentes reutilizables de la interfaz, como tarjetas para personajes, botones personalizados, etc.

### Otros archivos

- service_locator.dart:

    - Este archivo implementa la inyección de dependencias, registrando los servicios y objetos necesarios en la app, como los repositorios, los casos de uso y las fuentes de datos.

- main.dart:

    - Punto de entrada de la aplicación. Configura el ServiceLocator y establece la primera pantalla (CharactersPage).

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