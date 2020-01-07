import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home()
  ));

}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _infoText = "Informe seus dados";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields(){
    setState(() {
        weightController.text = "";
        heightController.text = "";
        _infoText = "Informe seus dados";
      });
    }
  void calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do peso (${imc})";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green),
            TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:"Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:"Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                width: 500,
                child:  RaisedButton(
                  onPressed: calculate,
                  child: Text("Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0,
                    ),),
                  color: Colors.green,
                ),
              ),
            ),
            Text("$_infoText",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0))
          ],
        ),
      )
    );
  }
}