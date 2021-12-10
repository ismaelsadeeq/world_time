import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime()async {
    WorldTime myInstance = WorldTime('Lagos', 'germany.png', 'Africa/Lagos');
    await myInstance.getTime();
    Navigator.pushReplacementNamed(context, '/Home',arguments:{
      'location':myInstance.location,
      'flag':myInstance.flag,
      'time':myInstance.time
    });
  }
  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text(
          'Loading'
      ),
    ));
  }
}
