import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class vehicle extends StatelessWidget {


  String name , license_plate , vehicle_type , color , drivername;
  vehicle(this.name  ,this.drivername , this.license_plate , this.vehicle_type , this.color);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg")
                      )
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Text(drivername,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
                Text(license_plate,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
                Text(color,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
                Text(vehicle_type,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
              ],
            ),



          ],

        ),
      ),
    );
  }
}
