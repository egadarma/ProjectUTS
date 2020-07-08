import 'package:flutter/material.dart';
import 'landing.dart';
import 'qrcode.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: new AppBar(
          leading: Icon(Icons.favorite),
          backgroundColor: Colors.blue,
          title: new Center(
            child: new Text("About Noun!"),
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
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //alignment: Alignment.center,
                        child: Image.asset(
                          'assets/noun.jpeg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                          height: 200.0,
                          child: new Column(
                            children: <Widget>[
                              new Icon(Icons.location_on,
                                  size: 70.0, color: Colors.white),
                              new Text(
                                'Location at Singaraja, Buleleng, Bali',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                              new Text('Happy Shopping and Enjoy it.')
                            ],
                          )),
                           Container( alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: RaisedButton(
                              child: Text('Visit our Instagram !'),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Qrcode();
                                  },
                                ));
                              },
                            ),
                          )
                    ]
                  )
                  )
                )
                
              );
  }
}
