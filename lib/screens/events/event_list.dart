

import 'package:comvis/blocs/event_bloc.dart';
import 'package:comvis/screens/events/event_card.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: BlocProvider(
          child: EventCard(),
          bloc: EventBloc()),
    );
  }
}
