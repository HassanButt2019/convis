
import 'package:comvis/blocs/vehicle_bloc.dart';
import 'package:comvis/models/vehicle.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VehicleDetail extends StatelessWidget {

  Vehicle vehicle;

  VehicleDetail(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DisplayImage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CardView(vehicle.name?? "No Name" , vehicle.license_plate?? "Abc-123" , vehicle.model?? "ABC",vehicle.vehicle_type?? "Truck" , vehicle.color?? "Black" , vehicle.occupied, vehicle.driver.first_name+' '+vehicle.driver.last_name)],
              ),
            ],
          )

    );
  }
  DisplayImage()
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.black,
            borderRadius: BorderRadius.circular(40.0),
          image: DecorationImage(
            image: NetworkImage("https://cdn.motor1.com/images/mgl/vEJmQ/s1/bmw-i8-m-rendering.jpg"),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
  CardView(name , plateNo , model , type , color , occupied , driverName)
  {
    return Container(

      height: 400.0,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
              topRight:Radius.circular(40.0)
        ),

      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(plateNo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,

              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Model :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,

                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(model,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                      fontWeight: FontWeight.bold

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Vehicle Type :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,

                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(type,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Vehicle Color :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,

                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(color,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Text("Occupied :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,

                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(occupied.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Text("Driver Name :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,

                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(driverName??"NO DRIVER",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

          ]
    ),
      ),
    );
  }
}
