import 'package:flutter/material.dart';
import 'landing.dart';
import 'sukses.dart';

class KritikSaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: new AppBar(
          leading: Icon(Icons.dashboard),
          backgroundColor: Colors.blue,
          title: new Center(
            child: new Text("How about Noun?"),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Here you are.',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Critics :',
                            ),
                            SizedBox(height: 10.0),
                            Container(
                                padding: new EdgeInsets.all(1.0),
                                child: new Column(children: <Widget>[
                                  new TextField(
                                    maxLines: 8,
                                    decoration: new InputDecoration(
                                      hintText: "Type something...",
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Suggestions :',
                                        ),
                                        SizedBox(height: 10.0),
                                        Container(
                                            padding: new EdgeInsets.all(1.0),
                                            child:
                                                new Column(children: <Widget>[
                                              new TextField(
                                                maxLines: 8,
                                                decoration: new InputDecoration(
                                                  hintText:
                                                      "Type something...",
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                             Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: RaisedButton(
                              child: Text('Submit'),
                              color: Colors.white12,
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Success();
                                  },
                                ));
                              },
                            ),
                          )
                                      ])
                                ]))
                          ])
                    ]))));
  }
}
