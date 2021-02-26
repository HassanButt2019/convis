import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class driver extends StatelessWidget {

  String fname , lname;

  driver(this.fname , this.lname  );
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
                Text(fname+' '+lname,
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Text("Detail 1",
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
                Text("Detail 2",
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
                Text("Detail 3",
                  style: TextStyle (
                      color: Colors.black,
                      fontSize: 12
                  ),
                )
              ],
            ),



          ],

        ),
      ),
    );
  }
}
