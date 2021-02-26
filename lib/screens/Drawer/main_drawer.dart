import 'package:comvis/global_variables.dart';
import 'package:flutter/material.dart';


class Main_Drawer extends StatelessWidget {
  @override
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.black,
            child: Center(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:NetworkImage('https://1z1euk35x7oy36s8we4dr6lo-wpengine.netdna-ssl.com/wp-content/uploads/2019/11/numze-e1572781662446.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  Text(driver.first_name+" "+driver.last_name,style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text(
              "Field One",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Field Two",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.all_out),
            title: Text(
              "Field Three",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.all_out),
            title: Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}