import 'package:comvis/charts/line_chart.dart';
import 'package:comvis/global_variables.dart';
import 'package:comvis/screens/pages/driver_list.dart';
import 'package:comvis/screens/pages/vehicle_list.dart';
import 'package:comvis/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'package:charts_flutter/flutter.dart' as charts;


class Dashboard extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500.0,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(3.0),
                children: <Widget>[



                  Item_Widget(Icons.add , "Vehicle List" , ),
                  Item_Widget(Icons.person , "Driver List" ,),
                  Item_Widget(Icons.assignment , "Assign Vehicle" ,),


                ],
              ),

            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     elevation: 8.0,
            //
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text("Collisions",
            //           style:TextStyle(
            //             fontSize: 20.0
            //           )
            //
            //         ),
            //         // Container(
            //         //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            //         //     height: 300,
            //         //     width: double.infinity,
            //         //     child:line_chart(),
            //         //
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ) ,
    );

  }
}
