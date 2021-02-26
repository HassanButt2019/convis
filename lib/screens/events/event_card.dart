import 'package:comvis/blocs/event_bloc.dart';
import 'package:comvis/models/events.dart';
import 'package:comvis/screens/events/critical_event_screen.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EventBloc _eventBloc = BlocProvider.of<EventBloc>(context);
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: _eventBloc.outEvent,
          builder: (BuildContext context , AsyncSnapshot<List<Events>> events){
            if(events.hasData)
              {
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context , index){
                      return Card(
                        elevation: 5.0,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(events.data[index].minutes+" Minutes Of Event", style: TextStyle(fontSize: 20.0)),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(events.data[index].distance+" Distance Of Event", style: TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(events.data[index].score+"  CB Score Of The Events", style: TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    RaisedButton(
                                      child: Text("Critical Events Of Event"),
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VideoScreen()));
                                      },
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            return CircularProgressIndicator();
          },
        )
      ),
    );
  }
}
