import 'dart:async';

import 'package:comvis/blocs/validator.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';



class LoginBloc with Validators implements BlocBase
{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();


  //Getters
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);


  Stream<bool> get isValid => Rx.combineLatest2(email, password, (a, b) => null);
  //Setters

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


  //Transformrs


  void submit() {
    print(_email.value);
    print(_password.value);
  }





  @override
  void dispose() {
    // TODO: implement dispose
  }

}