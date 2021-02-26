


import 'dart:async';

import 'package:comvis/apis/api_service.dart';
import 'package:comvis/global_variables.dart';
import 'package:comvis/models/driver.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/cupertino.dart';

class DriverBloc implements BlocBase
{


  bool is_active = false;
  int cb_Score;
  int count = 0;
  List<Driver> drivers;


  StreamController< List<Driver>> _driverController = StreamController< List<Driver>>();
  Sink<List<Driver>> get _indriver => _driverController.sink;
  Stream<List<Driver>> get outdriver => _driverController.stream;

  StreamController<int> _scoreController = StreamController<int>();
  Sink<int> get _inscore => _scoreController.sink;
  Stream<int> get outscore => _scoreController.stream;

  DriverBloc()
  {
    getDriver();
  }

  DriverBloc.fromDriverBloc(String Email)
  {
    print(Email);
    getScore(Email);

  }


  void getDriver() async
  {
    ApiServices apiServices = ApiServices();
    drivers = await apiServices.getDrivers();
    print(drivers);
    _indriver.add(drivers);
  }

  void getScore(String email) async
  {
    ApiServices apiServices = ApiServices();
    is_active = true;
    cb_Score = await apiServices.getScore(email);
    print("hello  {$cb_Score}");
    _inscore.add(cb_Score);
    is_active = false;
  }


  @override
  void dispose() {
    _driverController.close();
  }

}