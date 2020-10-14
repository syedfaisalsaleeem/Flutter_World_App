import 'package:flutter/material.dart';
import'package:world_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
  void setupWorldTime()async{
   WorldTime instance= WorldTime(location:"Berlin",flag:"germany.png",url:"Europe/Berlin");
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     "data":instance,
     "location":instance.location,
     "flag":instance.flag,
     "time":instance.time,
     'isDaytime':instance.isDaytime
   });
   // setState(() {
   //   time=instance.time;
   // });
   // print('$instance.time sda');
  }
  @override
  void initState(){
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      // body:Text(time)
      body:Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
