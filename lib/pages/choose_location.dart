import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void initState() {
    super.initState();
    print("init State run");
  }

  @override
  Widget build(BuildContext context) {
    print("build state run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a Location'
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:Column(
        children: [
            
        ],
      )
    );
  }
}
