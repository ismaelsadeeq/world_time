import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime()async {
    WorldTime myInstance = WorldTime('Lagos', 'nigeria.png', 'Africa/Lagos');
    await myInstance.getTime();
    Navigator.pushReplacementNamed(context, '/Home',arguments:{
      'location':myInstance.location,
      'flag':myInstance.flag,
      'time':myInstance.time,
      'isDayTime':myInstance.isDayTime
    });
  }
  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[500],
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
          child:SpinKitFadingCube(
            color: Colors.white,
            size: 60.0,
          )
      )
    ));
  }
}
