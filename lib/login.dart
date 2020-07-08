import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visible = false;
  final String sUrl = "https://mysimrs.com/api/";

  @override
  void initState() {
    super.initState();
  }

  _cekLogin() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "slogin.php?username=" +
        userNameController.text +
        "&password=" +
        passwordController.text;

    try {
      var res = await http.get(sUrl + params);
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['response_status'] == "OK") {
          prefs.setBool('slogin', true);
          setState(() {
            visible = false;  
          });

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/landing', (Route<dynamic> route) => false);
        } else {
          setState(() {
            visible = false;
          });
          _showAlertDialog(context, response['response_message']);
        }
      }
    } catch (e) {}
  }

  _showAlertDialog(BuildContext context, String err) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topRight,
          end: FractionalOffset.bottomLeft,
          colors: [
            Colors.blueAccent,
            Colors.blue,
            Colors.lightBlueAccent,
            Colors.lightBlue
          ],
        )),
      ),
      Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '',
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              padding: new EdgeInsets.all(1.0),
                              child: new Column(children: <Widget>[
                                new TextField(
                                  controller: userNameController,
                                  decoration: new InputDecoration(
                                    icon: Icon(Icons.perm_identity),
                                    hintText: "Enter your Username",
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                              ]))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '',
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              padding: new EdgeInsets.all(1.0),
                              child: new Column(children: <Widget>[
                                new TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                        icon: Icon(Icons.lock),
                                        hintText: "Enter your Password",
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ))),
                              ])),
                          Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () =>
                                  print('Forgot Password Button Pressed'),
                              padding: EdgeInsets.only(right: 0.0),
                              child: Text(
                                'Forgot Password?',
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: RaisedButton(
                              child: Text("Login"),
                              onPressed: () {
                                _cekLogin();
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ]),
                    Container(
                      alignment: Alignment.center,
                      child: new Column(children: <Widget>[
                        Text(
                          'Happy Shopping!',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          '#JustAtHome',
                        )
                      ]),
                    )
                  ])))
    ]));
  }

  
}
