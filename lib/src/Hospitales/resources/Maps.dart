import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
//    @override
//    _Maps createState() => _Maps();
    return _Maps();
  }

}

class _Maps extends State<Maps> {

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-0.214314, -78.499005);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(-0.214314, -78.499005),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is the title',
            snippet: 'This is the snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

      return Column(
        children: <Widget>[
           Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 5,
              right: 5
            ),
            width: 380,
            height: 300,

            child: Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  mapType: _currentMapType,
                  markers: _markers,
                  onCameraMove: _onCameraMove,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        button(_onMapTypeButtonPressed, Icons.map),
                        SizedBox(
                          height: 16.0,
                        ),
                        button(_onAddMarkerButtonPressed, Icons.add_location),
                        SizedBox(
                          height: 16.0,
                        ),
                        button(_goToPosition1, Icons.location_searching),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      );

  }

}