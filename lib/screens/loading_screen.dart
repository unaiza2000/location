import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    //higher the acuuracy bigger the battery power used.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  getUserPermissions() async {
    // Map<Permission, PermissionStatus> permissions =
    // await PermissionHandler().requestPermissions([Permission.storage , Permission.microphone]);
    Map<Permission, PermissionStatus> permissions =
    await [Permission.location].request();

    print("permission");
    print(permissions);
    // }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserPermissions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
