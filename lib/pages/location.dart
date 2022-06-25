import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', url: 'Europe/London'),
    WorldTime(location: 'New york', url:'America/New_York'),
    WorldTime(location: 'South Korea', url:'Asia/Seoul'),
    WorldTime(location: 'Nigeria', url: 'Africa/Lagos')
  ];

  void updateTime(index) async{
    WorldTime instanceOfTime = locations[index];
    await instanceOfTime.getTime();
    
    Navigator.pop(context, {
      'location' : instanceOfTime.location,
      'time': instanceOfTime.time,
      'isDayTime' : instanceOfTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: const Icon(Icons.location_on_outlined)
              ),
            ),
          );
        },

      )
    );
  }
}
