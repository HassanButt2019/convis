
import 'package:comvis/blocs/driver_bloc.dart';
import 'package:comvis/blocs/vehicle_bloc.dart';
import 'package:comvis/models/driver.dart';
import 'package:comvis/models/vehicle.dart';
import 'package:comvis/screens/authentication/sigin.dart';
import 'package:comvis/screens/profileScreens/add_driver.dart';
import 'package:comvis/screens/profileScreens/add_vehicle.dart';
import 'package:comvis/screens/scores/scoreScreen.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:comvis/widgets/driver_widget.dart';
import 'package:flutter/material.dart';

class available_drivers extends StatelessWidget {

 VehicleBloc vehicleBloc = VehicleBloc();

 Vehicle vehicle;

 available_drivers({this.vehicle});


  showAlertDialog(BuildContext context , title , content , driver) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {},
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        vehicle.drivers = driver;
        print(vehicle.name);
        print(vehicle.driver.first_name);
        vehicleBloc.addVehicle(vehicle);

        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Assigned Driver Success Fully'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      }
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final DriverBloc _driver = BlocProvider.of<DriverBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Available Driver List"),
      ),
      body: StreamBuilder<List<Driver>>(
        stream: _driver.outdriver,
        initialData: [],
        builder: (BuildContext context ,  drivers){
          if(drivers.hasData){
            return ListView.builder(
                itemCount: drivers.data.length,
                itemBuilder:(BuildContext context , int index){
                  return InkWell(
                      onTap: () => showAlertDialog(context , "Assignment Alert" , "Do You Want To Assign This Driver To This Vehicle" , drivers.data[index]),
                      child :driver(drivers.data[index].first_name ,  drivers.data[index].last_name)
                  );
                  // ListTile(
                  //   title: Text(drivers.data[index].first_name+' ' + drivers.data[index].last_name),
                  //   // onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlocProvider<ProductBloc>(child: SelectedCategoryPage(), bloc: ProductBloc(categories.data[index])))),
                  //   // title: Text(drivers.data[index].name),
                  // );
                }
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
