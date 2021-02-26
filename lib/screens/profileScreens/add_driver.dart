import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add_driver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blueAccent , Colors.blueAccent])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Add Driver",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: driverForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class driverForm extends StatefulWidget {
  @override
  _driverFormState createState() => _driverFormState();
}

class _driverFormState extends State<driverForm> {
  bool SelectGuard = true;
  bool SelectSweaper = false;
  TextEditingController _residentName = TextEditingController();
  TextEditingController _residentPhone = TextEditingController();
  TextEditingController _building = TextEditingController();
  TextEditingController _flat = TextEditingController();
  TextEditingController _residentCnic = TextEditingController();
  TextEditingController _residentemail = TextEditingController();
  TextEditingController _residentpassword = TextEditingController();

  bool nameProvided = false;
  bool phoneProvided = false;
  bool buildingProvided = false;
  bool flatProvided = false;
  bool CNICProvided = false;
  bool emailProvided = false;
  bool passwordProvided = false;

  String nameErrorText;
  String phoneErrorText;
  String buildingErrorText;
  String flatErrorText;
  String CNICErrorText;
  String passwordErrorText;
  String emailErrorText;
  //
  // _settingModalBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //             child: new Wrap(
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                     "Options",
  //                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.picture_as_pdf),
  //                   title: Text(
  //                     "Select From Gallery",
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     _pickImage(ImageSource.gallery);
  //                     Navigator.pop(context);
  //                     setState(() {});
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.camera),
  //                   title: Text(
  //                     "Open Your Camera",
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     _pickImage(ImageSource.camera);
  //                     Navigator.pop(context);
  //                     setState(() {});
  //                   },
  //                 ),
  //               ],
  //             ));
  //       });
  // }

  // Future<void> _pickImage(ImageSource source) async {
  //   File _selected = await ImagePicker.pickImage(source: source);
  //   setState(() {
  //     if(_selected==null){
  //       Toast.show("No Image Added", context,
  //           duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  //     }
  //     else
  //     {
  //       _imageFile = _selected;
  //       Toast.show("Image Added", context,
  //           duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  //     }
  //   });
  // }

  // void clear() {
  //   setState(() {
  //     _imageFile = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: 10.0,
                right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Center(
                //     child: GestureDetector(
                //       onTap: () {
                //         // _settingModalBottomSheet(context);
                //
                //
                //       },
                //       child: _imageFile != null
                //           ? //ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.file(_imageFile,fit: BoxFit.fill,),)
                //
                //       Container(width: 100, height: 100,
                //           decoration:BoxDecoration(border:Border.all(color: Colors.grey),shape: BoxShape.circle, image: new DecorationImage(image: new FileImage(_imageFile), fit: BoxFit.cover,)))
                //
                //           : Container(decoration: BoxDecoration(border:Border.all(color: Colors.grey),color: Colors.grey[200],borderRadius: BorderRadius.circular(50)),width: 100,
                //         height: 100,child: Icon(Icons.camera_alt,color: Colors.grey[800],),),
                //     )),
                SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    "Vehicle Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
//                text_input(
//                    'Enter Resident\'s Full Name', Icons.contact_mail, false),
                TextField(
                  controller: _residentName,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    hintText: 'Enter Driver Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    errorText: (nameProvided)?null:nameErrorText,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {},

                  onChanged: (name) {
                    print(name);
                    setState((){

                      RegExp regExp =
                      new RegExp(
                        r"[a-zA-Z]",
                        caseSensitive: true,
                      );
                      RegExp regExp2 =
                      new RegExp(
                        r"[0-9]",
                      );
                      RegExp regExp6 =
                      new RegExp(
                        r"[$&+,:;=?@#|'<>.^*()%!-]",

                      );



                      if (name.isEmpty) {
                        nameErrorText='*Enter Full name';
                        nameProvided=false;
                      }
                      else if(regExp6.hasMatch(name))
                      {
                        nameErrorText='*You can not use special characters here';
                        nameProvided= false;
                      }
                      else if(regExp2.hasMatch(name)){
                        nameErrorText= '*You can not use numbers';
                        nameProvided= false;
                      }
                      else if (name.length <= 3) {
                        nameErrorText='*Length of name should be greater than 3';
                        nameProvided=false;
                      }
                      else if(!name.contains(' ')){
                        nameErrorText= '*Please also add the last name';
                        nameProvided= false;
                      }

                      else if(regExp.hasMatch(name) ){
                        nameErrorText= null;
                        nameProvided= true;
                      }

                    });

                  },
                  obscureText: false,
                ),
                SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    "Mobile Number",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
//                text_input('Enter Resident\'s Phone', Icons.phone, false),
                TextField(
                  controller: _residentPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText:  (phoneProvided)?null:phoneErrorText,
                    hintText: 'Enter Mobile Number',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {},
                  onChanged: (phone) {
                    setState(() {

                      if (phone.isEmpty) {
                        phoneErrorText='*Enter Phone Number';
                        phoneProvided=false;
                      }
                      else if (phone.length!=11) {
                        phoneErrorText='*Length should be 11 ';
                        phoneProvided= false;
                      }
                      else  {
                        phoneErrorText = null;
                        phoneProvided = true;
                      }
                      print(phone);
                      print(phoneProvided);

                    });
                  },
                ),

//                text_input(
//                    'Enter Worker\'s Address', Icons.add_location, false),

                //text_input('Building', Icons.location_on, false),
                SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    "CNIC",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
//                text_input(
//                    'Enter Resident\'s CNIC', Icons.card_membership, false),
                TextField(
                    controller: _residentCnic,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      errorText:  (CNICProvided)?null:CNICErrorText,
                      hintText: 'Enter Cnic Number',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))),
                      prefixIcon: Icon(
                        Icons.card_membership,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},

                    onChanged: (cnic) {
                      print(cnic);
                      setState(() {


                        if (cnic.isEmpty) {
                          CNICErrorText='*Enter CNIC';
                          CNICProvided=false;
                        }
                        else if (cnic.length!=13) {
                          CNICErrorText="length should be 13";
                          CNICProvided= false;
                        }
                        else  {
                          CNICErrorText=null;
                          CNICProvided= true;
                        }

                      });}

                ),
                // SizedBox(
                //   height: 22.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 5, bottom: 10),
                //   child: Text(
                //     "Enter Color",
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //       fontSize: 17,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                // TextField(
                //   controller: _residentemail,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     hintText: 'Color',
                //     labelStyle: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey,
                //     ),
                //     errorText: (emailProvided)?null:emailErrorText,
                //     floatingLabelBehavior: FloatingLabelBehavior.always,
                //     contentPadding:
                //     EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                //     border: OutlineInputBorder(
                //         borderRadius:
                //         BorderRadius.all(Radius.circular(15))),
                //     prefixIcon: Icon(
                //       Icons.email,
                //       color: Colors.grey,
                //     ),
                //   ),
                //   onTap: () {},
                //
                //   onChanged: (email) {
                //     print(email);
                //     setState(() {
                //
                //       RegExp regExp =
                //       new RegExp(
                //         r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])",
                //         caseSensitive: true,
                //       );
                //       if (email.isEmpty) {
                //         emailErrorText='*Enter Email';
                //         emailProvided=false;
                //       }
                //       else if (!email.contains('@')) {
                //         emailErrorText='*Email should contain @ ';
                //         emailProvided= false;
                //       }
                //       else if (!email.contains('.')) {
                //         emailErrorText="Email should contain '.'";
                //         emailProvided=false;
                //       }
                //       else if (email.contains(' ')) {
                //         emailErrorText = 'invalid character found';
                //         emailProvided = false;
                //       }
                //       else if (regExp.hasMatch(email)) {
                //         emailErrorText=null;
                //         emailProvided= true;
                //       }
                //     });
                //
                //
                //   },
                //   obscureText: false,
                // ),
                // SizedBox(
                //   height: 22.0,
                // ),
                //
                SizedBox(
                  height: 27.0,
                ),
                Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    color: Colors.blueAccent,
                    elevation: 7.0,
                    child: MaterialButton(
                      onPressed: () {

                        //
                        // if(_imageFile==null)
                        // {
                        //   Toast.show("Image Required", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                        // }
                        // else if(_imageFile!=null &&  nameProvided && phoneProvided && buildingProvided && flatProvided && CNICProvided && emailProvided && passwordProvided  ){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                        //   Toast.show("Resident Added", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                        // }
                        // else{
                        //   Toast.show("Field Missing", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                        // }
                      },
                      child: Center(
                        child: Text(
                          'Add Driver',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}