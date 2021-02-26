import 'package:comvis/blocs/driver_bloc.dart';
import 'package:comvis/blocs/sign_in_bloc.dart';
import 'package:comvis/screens/Dashboard/dashboard.dart';
import 'package:comvis/screens/authentication/forgetScreen.dart';
import 'package:comvis/screens/scores/scoreScreen.dart';
import 'package:comvis/widgets/bloc_provider.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Text(
              'Sign in',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        hintText: "Enter email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: bloc.changeEmail,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: StreamBuilder<String>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: bloc.changePassword,
                      );
                    }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: Text("Forget Password?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotPasswordScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Container(
                        height: 50.0,
                        //width: 150,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.black,
                          color: Colors.black,
                          elevation: 7.0,
                          child: StreamBuilder<Object>(
                              stream: bloc.isValid,
                              builder: (context, snapshot) {
                                return GestureDetector(
                                  onTap: snapshot.hasError
                                      ? null
                                      : () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Dashboard()));
                                        },
                                  child: Center(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
