import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final valleduparLocation = const LatLng(10.456, -73.247);
  final bogotaLocation = const LatLng(4.624335, -74.063644);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Colombia'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: bogotaLocation,
          minZoom: 5.5,
          maxZoom: 25.0,
          initialZoom:5.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(markers: [
            Marker(
              point: valleduparLocation,
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40.0,
              ),
            ),
            Marker(
              point: bogotaLocation,
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40.0,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
