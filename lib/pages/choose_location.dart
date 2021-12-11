import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime( 'London', 'uk.png', 'Europe/London'),
    WorldTime( 'Athens', 'greece.png','Europe/Berlin'),
    WorldTime( 'Lagos', 'nigeria.png','Africa/Lagos'),
    WorldTime('Cairo', 'egypt.png','Africa/Cairo', ),
    WorldTime( 'Nairobi', 'kenya.png','Africa/Nairobi'),
    WorldTime( 'Chicago', 'usa.png','America/Chicago'),
    WorldTime( 'New York', 'usa.png','America/New_York'),
    WorldTime('Seoul', 'south_korea.png','Asia/Seoul'),
    WorldTime( 'Jakarta',  'indonesia.png','Asia/Jakarta'),
  ];
  void updateTime(index) async {
    WorldTime myInstance = locations[index];
    await myInstance.getTime();
    Navigator.pop(context, {
      'location': myInstance.location,
      'flag': myInstance.flag,
      'time': myInstance.time,
      'isDayTime': myInstance.isDayTime
    }
    );
    print('done');
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      )
    );
  }
}
