
import 'dart:convert';


import 'package:comvis/global_variables.dart';
import 'package:comvis/models/driver.dart';
import 'package:comvis/models/events.dart';
import 'package:comvis/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  Future<int> getScore(String email) async
  {

    int score = 79;
    return score;
    // final path = 'http://192.168.128.1:3000/score';
    // var response;
    // try {
    //   print('Get API CALLED $path');
    //   response = await http.get(
    //     path
    //   );
    //
    //   var respondedMap = json.decode(response.body)['data'];
    //   print("HELLO");
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     print("HELLO");
    //     return respondedMap['zainEhtesham'];
    //   } else {
    //     return 0;
    //   }
    // } catch (e) {
    //
    //
    // }


  }

  Future updateVehicle(Vehicle vehicle){
    print("Updated");
  }
  Vehicle getVehicle(id)
  {
    Vehicle vehicles = Vehicle("Shezore", "ACD-4532", "GREY", "2000", "TRUCK" , "https://cdn.motor1.com/images/mgl/vEJmQ/s1/bmw-i8-m-rendering.jpg");
    return vehicles;
  }

  List<Driver> getDrivers()
  {
    List<Driver> driver_list  =  [Driver.crate("Hassan", "Butt", 30.0, "12345678910", "hassanqa13@gmail.com", "", "03343509585"),Driver.crate("Zain", "Ehtesham", 40.0, "12345678910", "hassanqa13@gmail.com", "", "03343509585")];
    return driver_list;
  }

  List<Vehicle> getVehicles()
  {
    List<Vehicle> vehicle_list  =  [ Vehicle("Shezore", "ACD-4532", "GREY", "2000", "TRUCK" , "https://cdn.motor1.com/images/mgl/vEJmQ/s1/bmw-i8-m-rendering.jpg"),Vehicle("name", "license_plate"," color", "model", "vehicle_type" , "")];
    return vehicle_list;
  }

  List<Events> getEvents()
  {
    List<Events> tempList = [Events.create("10", "23", "30") ,Events.create("12", "11", "23") , Events.create("23", "23", "34"),Events.create("45", "31", "12"),Events.create("12", "12", "123"),Events.create("34", "43", "32") ];
    return tempList;
  }
}