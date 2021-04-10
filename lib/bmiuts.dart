import 'dart:html';

import 'package:flutter/material.dart';
class Bmi extends StatefulWidget{
  @override
_BmiState createState()=> _BmiState();
}

class _BmiState extends State<Bmi>{
  var berat = 0, tinggi =0, nama="", teks="";
  double tMeter = 0, hasil = 0, hasil1, hasilL= 0;

  final TextEditingController b = new TextEditingController();
  final TextEditingController t = new TextEditingController();
  final TextEditingController n = new TextEditingController();

  void hitung(){
    setState(() {
      berat = int.parse(b.text);
      tinggi = int.parse(t.text);
      tMeter = tinggi * 0.010;
      nama = n.text;
      hasil =berat / (tMeter * tMeter);
      hasil = double.parse(hasil.toStringAsFixed(1));
      if (hasil >= 18.5 && hasil <23){
        teks =
        "$nama, berat badan anda ideal, pola makannya tetap di jaga ";
      }else if (hasil >= 23 && hasil < 25){
         teks =
        "$nama, berat badan anda kelebihan, di jaga pola makanny ya ";
         }else if (hasil >= 25 && hasil < 30){
         teks =
        "$nama, berat badan anda sangat  kelebihan, anda memasuki kelebihan obesitas level 1";
         }else if (hasil >= 30){
         teks =
        "$nama, berat badan anda memasuki obesitas level 2 ";
         }else if (hasil >= 17){
         teks =
        "$nama, anda kekurangan berat badan, makan yang banyak ya jangan takut gode ";
         }else  {
         teks =
        "$nama, berat badan anda sangat kurang, makan yuk, makan itu enak loh ";
      } 

    });
  }
void hapus(){
  setState((){
    b.text = "";
    t.text = "";
    n.text = "";
    teks="";
    berat= 0;
    tinggi =0;
    hasil= 0;
    hasilL=0;
  });
}
@override
Widget build(BuildContext context){
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Masa tubuh"),
    backgroundColor: Colors.pink,
    ),
body: new ListView(
  children: <Widget>[
    new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Column(
        children:<Widget> [
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
              child:new Center(
                child: new Text(
                "Cek Kesehatanmu dengan mengisi Form di bawah ini:",
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new TextField(
                controller:n,
                decoration: new InputDecoration(
                  hintText:"Masukan nama anda",
                  labelText:"Nama:",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))), 
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller:b,
                    decoration: new InputDecoration(
                      hintText:"Masukan berat badan anda",
                  labelText:"Berat:",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))), 
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller:t,
                    decoration: new InputDecoration(
                      hintText:"Masukan tinggi badan anda",
                  labelText:"Tinggi:",
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
               padding: new EdgeInsets.only(right: 20.0),
               ),
               new RaisedButton(
                 onPressed: hapus,
                 child: new Text("Hapus"),
                 color: Colors.cyan.shade500)
        ],
               ),
             ),
             new Padding(
               padding: new EdgeInsets.only(top:10.0),
               child: new Text(
                 "Berat badan : $berat",
                 style: new TextStyle(fontSize: 17.0),
               ),
             ),
             new Text(
               "Tinggi Badan : $tinggi",
                style: new TextStyle(fontSize: 17.0),
             ),
             new Text(
               "Nilai BMI : $hasil",
                style: new TextStyle(
                  fontSize: 17.0, fontWeight: FontWeight.bold),
               ),
               new Padding(
               padding: new EdgeInsets.only(top: 10.0),
               child: new Text(
                 "$teks",
                 textAlign: TextAlign.justify,
                 style: new TextStyle(
                   fontSize: 20.0, fontWeight:  FontWeight.bold),
                 )),
                ],
               ),
                )
                ],
),
            );
}
}