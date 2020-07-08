import 'package:flutter/material.dart';
//import  terlebih  dahulu  halaman  yang  diperlukan
import 'detailproduk.dart';

//Top  Level/Root
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First  App',
      home: Listproduk(),
    );
  }
}

class Listproduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar:
            AppBar(backgroundColor: Colors.blue, title: Text("Daftar Produk")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    //berisi parameter yang diperlukan di class ProductBox
                    name: "Noun Yellow Hype",
                    //description: "Ini laptop ACer Cangih",
                    price: 130000,
                    image: "nounyellow.jpeg",
                  ),
                ));
              },
              child: ProductBox(
                //berisi parameter yang diperlukan di class ProductBox
                name: "Noun Yellow Hype",
                //description: "Ini laptop ACer Cangih",
                price: 130000,
                image: "nounyellow.jpeg",
              ),
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("Beli"),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Noun Paradise",
                      //description: "Ini laptop ACer Cangih",
                      price: 130000,
                      image: "noungambar.jpeg",
                    ),
                  ));
                },
                child: ProductBox(
                  name: "Noun Paradise",
                  //description: "Ini laptop ACer Cangih",
                  price: 130000,
                  image: "noungambar.jpeg",
                )),
                RaisedButton(
              color: Colors.orange,
              child: Text("Beli"),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
            
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "Noun White",
                    //description: "Ini laptop ACer Cangih",
                    price: 100000,
                    image: "nounwhite.jpeg",
                  ),
                ));
              },
              child: ProductBox(
                name: "Noun White",
                //description: "Ini laptop ACer Cangih",
                price: 100000,
                image: "nounwhite.jpeg",
              ), 
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("Beli"),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "Noun Black",
                    //description: "Ini laptop ACer Cangih",
                    price: 100000,
                    image: "nounblack.jpeg",
                  ),
                ));
              },
              child: ProductBox(
                name: "Noun Black",
                //description: "Ini laptop ACer Cangih",
                price: 100000,
                image: "nounblack.jpeg",
              ),
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("Beli"),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
          ],
        ));
  }
}

//menggunakan  widget  StatelessWidget
class ProductBox extends StatelessWidget {
//deklarasi  variabel  yang  diterima  dari  MyHomePage
  ProductBox({Key key, this.name, this.price, this.image}) : super(key: key);
//menampung  variabel  yang  diterima  untuk  dapat  digunakan  pada  class  ini
  final String name;
  final int price;
  final String image;

  Widget build(BuildContext context) {
//menggunakan  widget  container
    return Container(
//padding
        padding: EdgeInsets.all(2),
        //  height:  120,
        //menggunakan  widget  card
        child: Card(
            //membuat  tampilan  secara  horisontal  antar  image  dan  deskripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children  digunakan  untuk  menampung  banyak  widget
                children: <Widget>[
              Image.asset(
                "assets/" + image,
                width: 150,
              ),
              Expanded(
                  //child  digunakan  untuk  menampung  satu  widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat  tampilan  secara  vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini  isi  tampilan  vertikal  tersebut
                        children: <Widget>[
                          //menampilkan  variabel  menggunakan  widget  text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Harga:  " + this.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          //menampilkan  widget  icon    dibungkus  dengan  row
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[],
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
