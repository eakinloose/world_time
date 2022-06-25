import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{

      WorldTime instance = WorldTime(location: 'Nigeria',  url: 'Africa/Lagos');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location' : instance.location,
        'time': instance.time,
        'isDayTime' : instance.isDayTime
      });

  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Colors.white70,
        body: Center(
          child: SpinKitSpinningLines(
            color: Colors.blue,
            size: 80.0,
          ),
        ),
    );
  }
}