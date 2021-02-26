
import 'driver.dart';

class Vehicle
{
  String name = '';
  String imgUrl = '';
  String license_plate = '';
  String model = '';
  String color = '';
  String vehicle_type = '';
  Driver driver = Driver();
  bool occupied = false;



  Vehicle(this.name , this.license_plate , this.color , this.model ,this.vehicle_type  ,this.imgUrl);

  set drivers(Driver drivers)
  {
    this.driver = drivers;
  }

  Driver get drivers => this.driver;

}