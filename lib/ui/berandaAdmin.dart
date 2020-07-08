import 'package:flutter/material.dart';
import 'package:uts_mobile/ui/home.dart';
import '../detail_akun.dart';

class BerandaAdmin extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaAdmin> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Dasboard'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click  search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('Click  start');
            },
          ),
        ],
      ),
//widget  Drawer
      drawer: new Drawer(
//menggunakan  listView  agar  drawer  dapat  melebihi  width  devices
        child: new ListView(
          children: <Widget>[
//Drawer  Header  diisi  dengan  informasi  akun
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailAkun(
                    accountName: "I Putu Ega Suwidi Darma",
                    accountEmail: "ega@unduksha.ac.id",
                    backgroundImage: "profil.jpeg",
                  ),
                ));
              },
              child: UserAccountsDrawerHeader(
                accountName: new Text("I Putu Ega Suwidi Darma"),
                accountEmail: new Text("ega@unduksha.ac.id"),
                currentAccountPicture: new GestureDetector(
                  onTap: () {},
                  child: new CircleAvatar(
                    backgroundImage: AssetImage('assets/profil.jpeg'),
                  ),
                ),
//memberi  background  pada  Drawer  Header
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/backround.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
//Menu  Drawer
            new ListTile(
              title: new Text('Pemberitahuan'),
              trailing: new Icon(Icons.notifications_none),
            ),
            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),
            new ListTile(
              title: new Text('Akun'),
              trailing: new Icon(Icons.verified_user),
            ),
//Divider  Menu
            Divider(
              height: 2,
            ),

            new ListTile(
              title: new Text('Setelan'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Home()));
              },
              child: Center(
                  child: new Column(
                children: <Widget>[
                  new Icon(Icons.add_box, size: 80.0, color: Colors.black),
                  new Text(
                    'Tambah Data',
                    style: new TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ],
              )),
            ),
            color: Colors.white,
            margin:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 100, right: 100),
            elevation: 10.0,
          ),
        ],
      ),
    );
  }
}
