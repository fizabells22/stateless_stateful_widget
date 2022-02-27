import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void konversisuhu(){
    setState((){
    _inputUser = double.parse(etInput.text);
    _kelvin = _inputUser + 273.15;
    _reamur = _inputUser * 0.8;
  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
        title: Text ("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration( hintText: "Masukkan Suhu Dalam Celcius"),
                inputFormatters : [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                keyboardType: TextInputType.number,
              ),
            ],
            //bikin row untuk text suhu dalam kelvin dan reamur
          child : RaisedButton(
            textColor: Colors.white,
            onPressed: (){},
            color : Colors.blue,
            alignment : Alignment.bottomCenter,
            child : const Text(
              "Konversi Suhu",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ),
        ),
      ),
    );
  }
}

Convert (konvertHandler: _konversiSuhu),

class Convert extends StatelessWidget{
  final Function konvertHandler;

  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
        ),
    );
  }
  }
