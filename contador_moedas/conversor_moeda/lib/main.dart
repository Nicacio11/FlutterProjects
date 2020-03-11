import 'package:flutter/material.dart';

//biblioteca http para realizar as requisições
import 'package:http/http.dart' as http;
//biblioteca async para não travar a aplicação na hora das requisições
import 'dart:async';
//biblioteca para transformar em json
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=a3f6e8c7";
void main() async{
  
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white,
     ),
    ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Scaffold é um widget que permite que vc adicione appbar
///FutureBuilder é um widget que possibilitar infomar  "dados carregando" antes de todos carregarem
class _HomeState extends State<Home> {

  double dolar;
  double euro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text("Carregando Dados...", 
                    style: TextStyle(
                      color: Colors.amber, 
                      fontSize: 25.0), 
                    textAlign: TextAlign.center,)
                );
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text("Erro ao carregar Dados :(", 
                      style: TextStyle(
                        color: Colors.amber, 
                        fontSize: 25.0), 
                      textAlign: TextAlign.center,)
                  );
                }
                else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
                        buildTextField("Reais", "R\$"),
                        Divider(),
                        buildTextField("Dolares", "US\$"),
                        Divider(),
                        buildTextField("Euros", "€")
                      ],
                    ),
                  );
                }
          }
        },
        ),
    );
  }
}

Widget buildTextField(String label, String prefix){
  return TextField(
          style: TextStyle(color: Colors.amber),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.amber),
            border: OutlineInputBorder(),
            prefixText: prefix,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber)
          )
  )
}
Future<Map> getData() async{
  http.Response response = await http.get(request);
  return json.decode(response.body);
}