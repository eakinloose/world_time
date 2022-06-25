import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map locationData = {};

  @override
  Widget build(BuildContext context) {

    locationData = locationData.isNotEmpty? locationData : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = locationData['isDayTime'] ? 'assets/day.jpg' : 'assets/night.jpg';
    var bgColor = locationData['isDayTime'] ? Colors.blue : Colors.black38;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState((){
                          locationData = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'isDayTime' : result['isDayTime']
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location),
                      label: const Text(
                          'Choose Location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text(
                      locationData['location'],
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    )
                  ],),
                  const SizedBox(height: 30,),
                  Text(locationData['time'],style: const TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                  ),)
                ],
              ),
            ),
          )
      ),
    );
  }
}
