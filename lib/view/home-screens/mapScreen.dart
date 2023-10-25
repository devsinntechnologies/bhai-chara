import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(24.630160,46.752530);
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController  mapController;
  Map<String,Marker> _markers = {};
  addMarker(String id,LatLng location)async{
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title of place ',
        snippet: 'description of place ',
      )
    );





    var url = '  ';




   var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
    _markers[id] = marker;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: currentLocation, zoom:13,),
         onMapCreated :(controller){
          mapController = controller;
          addMarker("test ",currentLocation);
         },
          markers: _markers.values.toSet(),
          
          ),
    );
  }
}
