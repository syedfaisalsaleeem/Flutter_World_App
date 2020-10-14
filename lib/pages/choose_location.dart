import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter =0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void getData() async{
    String username1=await Future.delayed(Duration(seconds:3),(){
      print("yoshi");
    });
    String username2=await Future.delayed(Duration(seconds:3),(){
      return "bio";
    });
    print('$username1 - $username2');
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      "data":instance,
      "location":instance.location,
      "flag":instance.flag,
      "time":instance.time,
      'isDaytime':instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),

      body:ListView.builder(
          itemCount:locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                    // print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                    leading:CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                ),
              ),
            );
          }

      )

    );
  }
}
