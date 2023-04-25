import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  PermissionStatus _phonePermissionStatus = PermissionStatus.denied;
  PermissionStatus _smsPermissionStatus = PermissionStatus.denied;
  PermissionStatus _cameraPermissionStatus = PermissionStatus.denied;
  PermissionStatus _notifsPermissionStatus = PermissionStatus.denied;
  PermissionStatus _locationPermissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    // _checkAllPermissions();
    _requestLocationPermission();
    _requestCameraPermission();
    _requestPhonePermission();
    _requestNotificationPermission();
    _requestSmsPermission();
    super.initState();
  }

  // Future<void> _checkAllPermissions() async {
  //   _phonePermissionStatus = await Permission.phone.status;
  //   _smsPermissionStatus = await Permission.sms.status;
  //   _cameraPermissionStatus = await Permission.camera.status;
  //   _notifsPermissionStatus = await Permission.notification.status;
  //   _locationPermissionStatus = await Permission.locationWhenInUse.status;
  //   setState(() {});
  // }

  Future<void> _requestPhonePermission() async {
    final status = await Permission.phone.request();
    setState(() {
      _phonePermissionStatus = status;
    });
  }

  Future<void> _requestSmsPermission() async {
    final status = await Permission.sms.request();
    setState(() {
      _smsPermissionStatus = status;
    });
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _cameraPermissionStatus = status;
    });
  }

  Future<void> _requestNotificationPermission() async {
    final status = await Permission.notification.request();
    setState(() {
      _notifsPermissionStatus = status;
    });
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    setState(() {
      _locationPermissionStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Swiggy Holocron', style: TextStyle(color: Colors.orange),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                _locationPermissionStatus == PermissionStatus.granted
                    ? 'Location access granted!'
                    : 'Location access not granted',
              ),
            ),
            Center(
              child: Text(
                _cameraPermissionStatus == PermissionStatus.granted
                    ? 'Camera access granted!'
                    : 'Camera access not granted',
              ),
            ),
            Center(
              child: Text(
                _phonePermissionStatus == PermissionStatus.granted
                    ? 'Phone access granted!'
                    : 'Phone access not granted',
              ),
            ),
            Center(
              child: Text(
                _notifsPermissionStatus == PermissionStatus.granted
                    ? 'Notification access granted!'
                    : 'Notification access not granted',
              ),
            ),
            Center(
              child: Text(
                _smsPermissionStatus == PermissionStatus.granted
                    ? 'SMS access granted!'
                    : 'SMS access not granted',
              ),
            ),
            ElevatedButton(
              onPressed: _requestLocationPermission,
              child: Text('Grant Location Access'),
            ),
            ElevatedButton(
              onPressed: _requestCameraPermission,
              child: Text('Grant Camera Access'),
            ),
            ElevatedButton(
              onPressed: _requestNotificationPermission,
              child: Text('Grant Notification Access'),
            ),
            ElevatedButton(
              onPressed: _requestSmsPermission,
              child: Text('Grant SMS Access'),
            ),
            ElevatedButton(
                onPressed: _requestPhonePermission,
                child: Text('Grant Phone Access'),
            ),

            // if (_phonePermissionStatus != PermissionStatus.granted ||
            //     _smsPermissionStatus != PermissionStatus.granted ||
            //     _cameraPermissionStatus != PermissionStatus.granted ||
            //     _notifsPermissionStatus != PermissionStatus.granted ||
            //     _locationPermissionStatus != PermissionStatus.granted)
            //   ElevatedButton(
            //     onPressed: () {
            //       _requestPhonePermission();
            //       _requestSmsPermission();
            //       _requestNotificationPermission();
            //       _requestCameraPermission();
            //       _requestLocationPermission();
            //     },
            //     child: Text('Grant All Permissions'),
            //   )
            // else
            //   SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}
