import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterworldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading....";

  @override
  void initState()   {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: "India", flag: "india.png", url:"Asia/Kolkata",);
    await instance.getTime();
//    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'time' : instance.time,
      'flag' :instance.flag,
      'location': instance.location,
      "isDaytime" :instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
