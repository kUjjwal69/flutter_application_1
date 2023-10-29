import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              
              
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
              accountName: Text("Ujjwal Kumar"), 
              accountEmail: Text("ujjwalkumarsri01@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                "ASSETS/IMAGES/my Image.jpeg",
              ),),
              ),
              ),

              ListTile(
                leading: Icon(CupertinoIcons.home, 
               ),
               title: Text(
                "Home",
                textScaleFactor: 1.2,
                ),
              ),
               ListTile(
                leading: Icon(CupertinoIcons.profile_circled, 
               ),
               title: Text(
                "Profile",
                textScaleFactor: 1.2,
                ),
              ),
               ListTile(
                leading: Icon(CupertinoIcons.mail, 
               ),
               title: Text(
                "Email",
                textScaleFactor: 1.2,
                ),
              )
        
        ]
        ),
      ),
    );
  }
}