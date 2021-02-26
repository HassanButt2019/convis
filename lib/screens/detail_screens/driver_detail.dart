

import 'package:comvis/models/driver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverDetail extends StatelessWidget {

  Driver driver;
  DriverDetail({this.driver});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Detail"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          DislayImage(),
          CardView(driver.first_name+' ' +driver.last_name, driver.cb_score, driver.phone, driver.cnic, driver.available)
        ],
      ),
    );
  }

  DislayImage()
  {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        image: DecorationImage(
            image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
  CardView(name , score , phone , cnic , available )
  {
    return Container(
      height: 350.0,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight:Radius.circular(40.0)
        ),

      ),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey,
              ),
              Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text("Score :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(score.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),


              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text("Phone Number :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(phone,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text("Cnic :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(cnic,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text("Available :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(available.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),


            ]
        ),
      ),
    );
  }
}
