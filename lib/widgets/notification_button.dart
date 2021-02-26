
import 'package:comvis/screens/pages/notification_list.dart';
import 'package:flutter/material.dart';


class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            icon: Icon(Icons.notifications),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationList()));
            }
        ),
        Positioned(
          top: 7,
          right: 7,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              initialData: 0,
              builder: (context , snapshot){
                return Text(
                    snapshot.data.toString()
                );
              },

            ),
          ),
        )
      ],
    );
  }
}
