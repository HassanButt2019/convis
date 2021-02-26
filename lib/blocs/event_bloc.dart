


import 'dart:async';

import 'package:comvis/apis/api_service.dart';
import 'package:comvis/models/events.dart';
import 'package:comvis/widgets/bloc_provider.dart';

class EventBloc implements BlocBase
{
  List<Events> _events;

  StreamController<List<Events>> _eventController = StreamController<List<Events>>();
  Sink<List<Events>> get _inEvent => _eventController.sink;
  Stream<List<Events>> get outEvent => _eventController.stream;


  EventBloc()
  {
    getEvents();
  }
  void getEvents()
  {
    ApiServices apiServices = ApiServices();
    _events = apiServices.getEvents();
    _inEvent.add(_events);
  }

  @override
  void dispose() {

  }

}