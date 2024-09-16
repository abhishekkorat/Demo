import 'package:ad05/abhi2.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class abhi extends StatefulWidget {
  const abhi({super.key});

  @override
  State<abhi> createState() => _abhiState();
}

class _abhiState extends State<abhi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CheckDeviceVersion();
  }
  CheckDeviceVersion() async {
      DeviceInfoPlugin deviceInfo=DeviceInfoPlugin();

      AndroidDeviceInfo androidInfo=await deviceInfo.androidInfo;

      if(androidInfo.version.sdkInt<=32){
        askPermission12();
      }else{
        askpermission13();
      }
  }
  askPermission12() async {
    var status = await Permission.camera.status;
    var status1 = await Permission.storage.status;

    if (status.isGranted && status1.isGranted) {
      gonext();
    } else {
      await [Permission.camera, Permission.storage].request();

    var status = await Permission.camera.status;
    var status1 = await Permission.storage.status;

    if (status.isGranted && status1.isGranted) {
    gonext();
    } else {
    Navigator.pop(context);
    }
  }
  }
  askpermission13() async {
    var status = await Permission.camera.status;
    var status1 = await Permission.photos.status;
    var status2 = await Permission.videos.status;
    var status3 = await Permission.audio.status;

    if (status.isGranted &&
        status1.isGranted &&
        status2.isGranted &&
        status3.isGranted) {
      gonext();
    } else {
      await [Permission.camera, Permission.photos,Permission.videos,Permission.audio
      ].request();

      var status = await Permission.camera.status;
      var status1 = await Permission.photos.status;
      var status2 = await Permission.videos.status;
      var status3 = await Permission.audio.status;

      if (status.isGranted &&
          status1.isGranted &&
          status2.isGranted &&
          status3.isGranted) {
        gonext();
      } else {
        Navigator.pop(context);
      }
    }
  }
     
  gonext() async {
   await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return abhi2();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading..."),),
    );
  }
}
