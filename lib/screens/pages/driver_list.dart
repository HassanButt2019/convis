
import 'package:comvis/blocs/driver_bloc.dart';
import 'package:comvis/models/driver.dart';
import 'package:comvis/screens/authentication/sigin.dart';
import 'package:comvis/screens/detail_screens/driver_detail.dart';
import 'package:comvis/screens/profileScreens/add_driver.dart';
import 'package:comvis/screens/profileScreens/add_vehicle.dart';
import 'package:comvis/screens/scores/scoreScreen.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:comvis/widgets/driver_widget.dart';
import 'package:flutter/material.dart';

class driverList extends StatefulWidget {
  @override
  _driverListState createState() => _driverListState();
}

class _driverListState extends State<driverList> {
  @override
  Widget build(BuildContext context) {
    final DriverBloc _driver = BlocProvider.of<DriverBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver List"),
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
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DriverDetail(driver: drivers.data[index],))),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => add_driver())),

    ),
    );
  }
}
