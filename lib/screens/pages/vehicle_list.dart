
import 'package:comvis/blocs/vehicle_bloc.dart';
import 'package:comvis/models/vehicle.dart';
import 'package:comvis/screens/authentication/sigin.dart';
import 'package:comvis/screens/detail_screens/vehicle_detail.dart';
import 'package:comvis/screens/profileScreens/add_vehicle.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:comvis/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';

class vehicleList extends StatefulWidget {
  @override
  _vehicleListState createState() => _vehicleListState();
}

class _vehicleListState extends State<vehicleList> {
  @override
  Widget build(BuildContext context) {
    final VehicleBloc _vehicleBloc = BlocProvider.of<VehicleBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Vehicle List"),
        ),
        body: StreamBuilder<List<Vehicle>>(
          stream: _vehicleBloc.outehicles,
          initialData: [],
          builder: (BuildContext context , AsyncSnapshot<List<Vehicle>> vehicles){
            if(vehicles.hasData){
              return ListView.builder(
                  itemCount: vehicles.data.length,
                  itemBuilder:(context , index){

                      return InkWell(
                        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VehicleDetail(vehicles.data[index]))),
                        child: vehicle(vehicles.data[index].name , vehicles.data[index].driver?.first_name??"" , vehicles.data[index].license_plate , vehicles.data[index].vehicle_type , vehicles.data[index].color),
                      );
                  }
              );
            }
            return CircularProgressIndicator();
          },
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => add_vehicle())),

      ),
    );

  }
}
