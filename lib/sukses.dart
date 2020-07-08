import 'package:flutter/material.dart';
import 'landing.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: new AppBar(
          leading: Icon(Icons.dashboard),
          backgroundColor: Colors.blue,
          title: new Center(
            child: new Text("Thank You"),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.person_pin),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => LandingPage()));
                }),
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 50.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Success!!!!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

      
                    ]))));
  }
}