import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerJumlah = new TextEditingController();

  void addData() {
    var url = "http://192.168.43.65/noun_store/index.php/penjualan/save";

    http.post(url, body: {
      "nama": controllerNama.text,
      "harga": controllerHarga.text,
      "jumlah": controllerJumlah.text,
    });
  }

  Future<List> getData() async {
    final response =
        await http.get('http://192.168.43.65/noun_store/index.php/penjualan');
    return json.decode(response.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        leading: Icon(Icons.favorite),
        backgroundColor: Colors.blue,
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Item Nama", labelText: "Item Nama"),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "Harga", labelText: "Harga"),
                ),
                new TextField(
                  controller: controllerJumlah,
                  decoration: new InputDecoration(
                      hintText: "Jumlah", labelText: "Jumlah"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
