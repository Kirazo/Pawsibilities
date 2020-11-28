/*Citation:
  GoogleMaps API:
    https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#2
    https://medium.com/@rajesh.muthyala/flutter-with-google-maps-and-google-place-85ccee3f0371
*/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ParkMap extends StatefulWidget {
  @override
  _ParkMapState createState() => _ParkMapState();
}

class _ParkMapState extends State<ParkMap> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(33.12943764422752, -117.15951705599333);  //centered on csusm
  //LatLng _lastMapPosition;
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("Hollandia Park"),
      position: LatLng(33.1476584310334, -117.144979483178),
      infoWindow: InfoWindow(title: "Hollandia Park", snippet: '12 Mission Hills Ct, San Marcos'),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId("San Elijo Hills Dog Park"),
      position: LatLng(33.10229656561592, -117.20046508521827),
      infoWindow: InfoWindow(title: "San Elijo Hills Dog Park", snippet: 'San Elijo Rd N, San Marcos'),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId("Montiel Park"),
      position: LatLng(33.13201245341753, -117.11416657726762),
      infoWindow: InfoWindow(title: "Montiel Park", snippet: '2290 Montiel Rd, San Marcos'),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId("Lakeview Park"),
      position: LatLng(33.12471195697568, -117.17867980056019),
      infoWindow: InfoWindow(title: "Lakeview Park", snippet: '650 Foxhall Dr, San Marcos'),
      icon: BitmapDescriptor.defaultMarker,
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

/*  void _onCameraMove(CameraPosition position){
    _lastMapPosition = _center;
    _lastMapPosition = position.target;
  }*/

/*  void _onAddMakerButtonPressed(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dog Parks in San Marcos'),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              //onCameraMove: _onCameraMove,
              markers: _markers,
            ),
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => _onAddMakerButtonPressed(),
                  child: Icon(Icons.map),
                ),
              ),
            )*/
          ],
        )
      ),
    );
  }
}

