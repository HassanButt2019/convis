
import 'package:comvis/apis/api_service.dart';
import 'package:comvis/blocs/sign_in_bloc.dart';
import 'package:comvis/screens/authentication/sigin.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ComVis());
}


class ComVis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(child:LoginScreen(), bloc: LoginBloc()),

    );
  }
}
