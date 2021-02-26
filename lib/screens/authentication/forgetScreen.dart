
import 'package:flutter/material.dart';
class forgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: forgotPasswordScreen(),
    );
  }
}

class forgotPasswordScreen extends StatefulWidget {
  @override
  _forgotPasswordScreenState createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Align(
              alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Forgot Your Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                //  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.only(top: 25.0, left: 15, right: 20.0),
                  child: Text(
                    'Enter Your Email and we will send you a link to reset your password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,),
                  child: Text("Email",
                    textAlign: TextAlign.start,

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      //labelText: 'Email',
                      hintText: 'Enter your Email',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                          gapPadding: 10),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                          gapPadding: 10),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Container(
                    height: 50.0,
                    //width: 150,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.black,
                      color: Colors.black,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: Center(
                          child: Text(
                            'Send Link',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
          ),
    );
  }
}
