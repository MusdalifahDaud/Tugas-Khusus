import 'dart:html';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var berat = 0, tinggi = 0, nama = "", teks = "";
  double tmeter = 0, hasil = 0, hasil1, hasilL =0;

  final TextEditingController b = new TextEditingController();
  final TextEditingController t = new TextEditingController();
  final TextEditingController n = new TextEditingController();

  void hitung() {
    setState(() {
      berat = int.parse(b.text);
     tinggi = int.parse(t.text);
      tmeter = tinggi * 0.010;
      nama = n.text;
      hasil = berat / (tmeter * tmeter);
      hasilL = double.parse(hasil.toStringAsFixed(1));
      if (hasil >= 18.5 && hasil < 23) {
        teks = 
              "$nama, anda sangat sehat, harus jaga terus kesehatan anda seperti ini  ";
      } else if (hasil >=23 && hasil < 25) {
        teks ="$nama, anda kelebihan berat badan, rajinlah berolaraga ";
      } else if (hasil >= 25 && hasil < 30) {
        teks =
              "$nama, anda sangat kelebihan berat badan, level 1 anda harus mengurangai makan, minum dan juga olaraga";
      } else if (hasil >= 30) {
        teks =
              "$nama, anda sangat kelebihan berat badan, level 2 anda harus mengurangai makan, minum dan juga perbanyak olaraga ";
      } else if (hasil >= 17) {
        teks =
              "$nama, anda kekurangan berat badan, tingkatkan lagi pola makan dan minum anda ";
      } else {
        teks =
              "$nama, anda sangat kekurangan berat badan, tingkatkan lebih banyak lagi pola makan dan minum anda";
      }
  });
}

void hapus () {
  setState(() {
    b.text = "";
    t.text = "";
    n.text = "";
    teks = "";
    berat = 0;
    tinggi = 0;
    hasil = 0;
    hasilL = 0;

  });

}
@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title : new Text ("Body Mass Index"),
      backgroundColor: Colors.blue,
    ),
 body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Center(
            child: new Text(
              "Kalkulator BMI",
              style: new TextStyle(
               fontSize: 30.0,
               fontFamily: "Arial",
               fontWeight: FontWeight.bold),
            )),
           new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Center(
                    child: new Text(
                      "Cek Kesehatanmu dengan Mengisi Form di bawah ini :",
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
            new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new TextField(
                controller: n,
                decoration: new InputDecoration(
                  hintText: " Masukan Nama Anda",
                  labelText: " Nama :",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: b,
                    decoration: new InputDecoration(
                        hintText: "Masukan Berat Badan",
                        labelText: "Berat Badan:",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                controller: t,
                decoration: new InputDecoration(
                  hintText: "Masukan tinggi Anda",
                  labelText: "Tinggi :",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
                ),
              ), 
              new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Row(
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: hitung,
                        child: new Text("Hitung"),
                        color: Colors.cyan.shade500,
                      ),
                    new Padding(
                      padding:new EdgeInsets.only(right:20.0),
                    ),
                    new RaisedButton(
                      onPressed: hapus,
                      child: new Text("Hapus"),
                      color: Colors.cyan.shade500)
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
                child: new Text(
                  "Berat Badan : $berat",
                  style: new TextStyle(fontSize: 17.0),
                ),
              ),
              new Text(
                "Nilai BMI : $hasilL",
                style: new TextStyle(
                  fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
                child: new Text(
                  "$teks",
                  textAlign: TextAlign.justify,
                  style: new TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
               ],
              ),
             ),
           ],
          ),
        );
      }
    }

             