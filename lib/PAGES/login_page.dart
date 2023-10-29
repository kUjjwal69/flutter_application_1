import 'package:flutter/material.dart';
import 'package:flutter_application_1/UTILS/routes.dart';

class LoginPage extends StatelessWidget {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "ASSETS/IMAGES/undraw_Login_re_4vu2.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      labelText: "Enter Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Enter Password",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                
                Navigator.pushNamed(context, MyRoutes.HomeRoute);
              },
              child: Container(
                width: changeButton ? 50 : 150,
                height: 50,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8)),
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //
            //     },
            //     child: Text("Login"),
            //     style: TextButton.styleFrom(
            //       minimumSize: Size(150,40)
            //     )),
          ],
        ));
  }
}


