



import 'dart:async';

import 'package:comvis/apis/api_service.dart';
import 'package:comvis/models/driver.dart';
import 'package:comvis/models/vehicle.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/cupertino.dart';

class VehicleBloc implements BlocBase
{
  List<Vehicle> vehicles;
  Vehicle vehicle ;


  StreamController< List<Vehicle>> _vehicleController = StreamController< List<Vehicle>>();
  Sink<List<Vehicle>> get invehicles => _vehicleController.sink;
  Stream<List<Vehicle>> get outehicles => _vehicleController.stream;

  StreamController< Vehicle> _vehController = StreamController< Vehicle>();
  Sink<Vehicle> get invehicle => _vehController.sink;
  Stream<Vehicle> get outehicle => _vehController.stream;




  VehicleBloc()
  {
    getVehicles();
  }

  VehicleBloc.from(String id)
  {
    getVehicle(id);
  }



  void addVehicle(Vehicle veh)async
  {
    ApiServices apiServices = ApiServices();
    this.vehicle = veh;
    await apiServices.updateVehicle(vehicle);
    invehicle.add(vehicle);
  }

  void getVehicle(String id) async
  {
    ApiServices apiServices = ApiServices();
    vehicle = await apiServices.getVehicle(id);
    invehicle.add(vehicle);
  }

  void getVehicles() async
  {
    ApiServices apiServices = ApiServices();
    vehicles = await apiServices.getVehicles();
    invehicles.add(vehicles);
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }

}