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
      title: 'Flutter Konverter Suhu',
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
              Input(etInput: etInput),
              Output(kelvin: _kelvin, reamur: _reamur),
              Column(
              crossAxisAlignment : CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 40,
                  child: TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue,),
                  onPressed: konversisuhu,
                  child: const Text("Konversi Suhu", style : TextStyle(color: Colors.white),
                ),
                  ),
                ),
              ],
              ),
            ],
          ),
          ),),);
  }}

      class Output extends StatelessWidget {
        const Output({
          Key? key,
          required double kelvin,
          required double reamur,  
        })  :_kelvin = kelvin,
            _reamur = reamur,
            super(key:key);

        final double _kelvin;
        final double _reamur;

          @override
          Widget build(BuildContext context){      
            return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Suhu Dalam Kelvin", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200,
                          ),
                        ),
                        Container(
                        margin : const EdgeInsets.all(10),
                        child:Text("$_kelvin", style: const TextStyle( fontSize: 40 , fontWeight: FontWeight.w400,
                          ),
                        ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Suhu Dalam Reamur", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,
                          ),
                        ),
                        Container(
                        margin : const EdgeInsets.all(10),
                        child: Text("$_reamur", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w400,
            ),
          ),
                        ),
            ],
          ),
        ],
    );
  }
}

  class Input extends StatelessWidget {
        const Input({
        Key? key,
        required this.etInput,
       }) : super (key: key);

        final TextEditingController etInput;
        
        @override
        Widget build(BuildContext context){
         return TextFormField(
                decoration: const InputDecoration( hintText: "Masukkan Suhu Dalam Celcius"),
                controller: etInput,
                keyboardType: TextInputType.number,
    );
  }
}
