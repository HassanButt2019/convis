
import 'package:comvis/blocs/driver_bloc.dart';
import 'package:comvis/blocs/vehicle_bloc.dart';
import 'package:comvis/global_variables.dart';
import 'package:comvis/screens/pages/assignment_screen.dart';
import 'package:comvis/screens/pages/driver_list.dart';
import 'package:comvis/screens/pages/vehicle_list.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class Item_Widget extends StatelessWidget {

  IconData icon;
  String title;


  Item_Widget(this.icon ,this.title  );

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
         // decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              if(title == "Vehicle List")
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(child: vehicleList(), bloc: VehicleBloc())
                    ));
              else if (title == "Driver List")
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(child: driverList(), bloc: DriverBloc())
                    ));
              else
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(child: assignment_screen(), bloc: VehicleBloc())
                    ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}
