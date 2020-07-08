import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNama;
  TextEditingController controllerHarga;
  TextEditingController controllerJumlah;

  void editData() {
    var url =
        "http://192.168.43.65/noun_store/index.php/penjualan/save_update";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "harga": controllerHarga.text,
      "jumlah": controllerJumlah.text,
    });
  }

  @override
  initState() {
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerHarga =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerJumlah =
        new TextEditingController(text: widget.list[widget.index]['jumlah']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        leading: Icon(Icons.favorite),
        backgroundColor: Colors.blue,
        title: new Text("EDIT TEXT"),
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
                      hintText: "Item Name", labelText: "Item Name"),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
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
