import 'dart:async';
import 'dart:math';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'package:comvis/blocs/driver_bloc.dart';
import 'package:comvis/charts/bar_chart.dart';
import 'package:comvis/screens/Drawer/main_drawer.dart';
import 'package:comvis/screens/components/circular_prograss.dart';
import 'package:comvis/screens/events/event_list.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:comvis/widgets/notification_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScoreScreen extends StatefulWidget {

  double score;
  ScoreScreen({this.score});
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}



class _ScoreScreenState extends State<ScoreScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Tween<double> _tween;
  double position;
  int _currentIndex = 0;
  final List<Widget> _children = [];

  static var chartDisplay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _tween = Tween<double>(begin: 0, end: 100);
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    setNewPosition(widget.score);

    setState(() {


      var data = [
      BarChart("val 1 ", 10),
      BarChart("val 2 ", 20),
      BarChart("val 3 ", 30),
      BarChart("val 4 ", 40),
      BarChart("val 5 ", 50),

      ];

      var series  = [charts.Series(
      domainFn: (BarChart barchart , _)=> barchart.label,
       measureFn: (BarChart barchart , _)=> barchart.value,
       id: 'BarChart',
       data: data,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        fillColorFn: (_, __) =>
        charts.MaterialPalette.red.shadeDefault.darker,
      )];

      chartDisplay = charts.BarChart(
        series,
        animationDuration: Duration(milliseconds: 2000),

      );
    });

  }

  int score = 0;
  Widget setNewPosition(double newPosition) {
    _tween.end = newPosition;
    _animationController.reset();
    _tween.animate(_animationController);
    _animationController.forward();
    return Container(
      height: 0,
      width: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final _driverBloc = BlocProvider.of<DriverBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.bar_chart),
              title: new Text('Insights'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.video_collection),
              title: new Text('Events'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            )
          ],
        ),
        drawer: Main_Drawer(),
        appBar: AppBar(
          title: Text('Application Name'),
          backgroundColor: Colors.black,
          actions: [
            NotificationButton()
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5.0,
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Your CB Score:\t\t",
                                    style: TextStyle(fontSize: 20.0)
                                ),
                                Text(
                                  '${_animation.value.toInt()}',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 130.0,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  // setNewPosition(50.0),


                              //   StreamBuilder<int>(
                              //   stream: _driverBloc.outscore,
                              //   builder: (context , snapshot){
                              //     if (snapshot.hasData  && _driverBloc.count < 3)
                              //     {
                              //       _driverBloc.count++;
                              //       return  setNewPosition(snapshot.data.toDouble());
                              //     }
                              //     return Container();
                              //   },
                              // ),
                                  Container(
                                    child:
                                    CustomPaint(
                                      foregroundPainter:
                                      CircularProgress(_animation.value.toDouble()),

                                    ),
                                  ),



                                  SizedBox(
                                    height: 120.0,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    RaisedButton(
                                      child: Text("What is CB Score?"),
                                      onPressed: (){},
                                      color: Colors.white,
                                    ),
                                      RaisedButton(
                                        child: Text("Score History"),
                                        onPressed: (){},
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Card(
                  //   elevation: 5.0,
                  //   child: Container(
                  //     width: double.infinity,
                  //       height: 200,
                  //       child:chartDisplay),
                  // ),
                  // Card(
                  //   elevation: 5.0,
                  //   child: Container(
                  //       width: double.infinity,
                  //       height: 200,
                  //       child:Sparkline(
                  //         pointSize: 100.0,
                  //
                  //         data: [1,2,3,4,2,1,3,4,0.5],
                  //         lineColor:Colors.deepPurple
                  //       )),
                  // ),

                  // RaisedButton(
                  //   child: Text("Events"),
                  //   onPressed: (){
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Events()));
                  //   },
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
