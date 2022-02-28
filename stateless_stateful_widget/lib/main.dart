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
    _kelvin = _inputUser + 273;
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
        title: const Text ("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration( hintText: "Masukkan Suhu Dalam Celcius"),
                controller: etInput,
                keyboardType: TextInputType.number,
              ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Suhu Dalam Kelvin", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text("$_kelvin", style: const TextStyle( fontSize: 40 , fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Suhu Dalam Reamur", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text("$_reamur", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          Container(
          width: double.infinity,
          height : 50,
          child : RaisedButton(
          textColor: Colors.white,
          onPressed: konversisuhu,
          color : Colors.blue,
            child : const Text(
              "Konversi Suhu",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ),
            ],
        ),),
      ),
    );
  }
}
