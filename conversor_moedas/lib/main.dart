import 'package:conversor_moedas/classes/FirebaseAdmobManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//biblioteca http para realizar as requisições
import 'package:http/http.dart' as http;
//biblioteca async para não travar a aplicação na hora das requisições
import 'dart:async';
//biblioteca para transformar em json
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=a3f6e8c7";
const request2 = "https://economia.awesomeapi.com.br/json/all";

void main() async{
  
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Scaffold é um widget que permite que vc adicione appbar
///FutureBuilder é um widget que possibilitar infomar  "dados carregando" antes de todos carregarem
class _HomeState extends State<Home> {

  FirebaseAdmobManager fMan = FirebaseAdmobManager();

  @override
  void initState(){
    super.initState();

      fMan.showBannerAd();
      fMan.showInterstitialAd();
    //Ads.init();
  }

  final realController = TextEditingController();
  final dolarComercialController = TextEditingController();
  final euroController = TextEditingController();

  final dolarTurismoController = TextEditingController();
  final dolarCanadenseController = TextEditingController();
  final libraEsterlinController = TextEditingController();
  final pesoArgentinoController = TextEditingController();
  final liteCoinController = TextEditingController();
  final bitCoinController = TextEditingController();
  final ienesJaponesController = TextEditingController();
  final francoSuicoController = TextEditingController();
  final dolarAustralianoController = TextEditingController();

  double dolarComercial;
  double dolarTurismo;
  double dolarCanadense;
  double libraEsterlina;
  double pesoArgentino;
  double bitCoin;
  double liteCoin;
  double ieneJapones;
  double francoSuico;
  double dolarAustraliano;

  
  double euro;
  void _clearAll(){
    var vazio = "";
    dolarCanadenseController.text = vazio;
    realController.text = vazio;
    dolarComercialController.text = vazio;
    euroController.text = vazio;
    dolarTurismoController.text = vazio;
    libraEsterlinController.text = vazio;
    pesoArgentinoController.text = vazio;
    liteCoinController.text = vazio;
    bitCoinController.text = vazio;
    ienesJaponesController.text = vazio;
    francoSuicoController.text = vazio;
    dolarAustralianoController.text = vazio;
  }
  void _realChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    dolarComercialController.text = (valor/this.dolarComercial).toStringAsFixed(2);
    euroController.text = (valor/euro).toStringAsFixed(2);
    dolarTurismoController.text = (valor/dolarTurismo).toStringAsFixed(2);
    dolarCanadenseController.text = (valor/dolarCanadense).toStringAsFixed(2);
    libraEsterlinController.text = (valor/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (valor/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (valor/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (valor/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (valor/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (valor/francoSuico).toStringAsFixed(2);
    dolarAustralianoController.text = (valor/dolarAustraliano).toStringAsFixed(2);
  }
  void _dolarComercialChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.dolarComercial;
    realController.text = (result).toStringAsFixed(2);
    dolarTurismoController.text = (valor/dolarTurismo).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
  }
    void _dolarTurismoChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.dolarTurismo;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
  }
  void _dolarCanadenseChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.dolarCanadense;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
  }
  void _dolarAustralianoChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.dolarAustraliano;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
   void _libraEsterlinaChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.libraEsterlina;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
  void _ienesJaponesChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.ieneJapones;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
  void _pesoArgentinoChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.pesoArgentino;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
  }
    void _francoSuicoChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.francoSuico;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
  void _liteCoinChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.liteCoin;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
  void _bitCoinChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.bitCoin;
    realController.text = (result).toStringAsFixed(2);
    dolarComercialController.text = (result/dolarComercial).toStringAsFixed(2);
    euroController.text = (result/euro).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
  }
  void _euroChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double valor = double.parse(text);
    double result = valor * this.euro;
    dolarComercialController.text = ((result)/this.dolarComercial).toStringAsFixed(2);
    realController.text = (result).toStringAsFixed(2);
    dolarTurismoController.text = (result/dolarTurismo).toStringAsFixed(2);
    dolarCanadenseController.text = (result/dolarCanadense).toStringAsFixed(2);
    libraEsterlinController.text = (result/libraEsterlina).toStringAsFixed(2);
    pesoArgentinoController.text = (result/pesoArgentino).toStringAsFixed(2);
    liteCoinController.text = (result/liteCoin).toStringAsFixed(2);
    bitCoinController.text = (result/bitCoin).toStringAsFixed(2);
    ienesJaponesController.text = (result/ieneJapones).toStringAsFixed(2);
    francoSuicoController.text = (result/francoSuico).toStringAsFixed(2);
    dolarAustralianoController.text = (result/dolarAustraliano).toStringAsFixed(2);
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("\$ Conversor de Moedas \$"),
        backgroundColor: Colors.blue,
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
                      color: Colors.blue, 
                      fontSize: 25.0), 
                    textAlign: TextAlign.center,)
                );
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text("Erro ao carregar Dados :(", 
                      style: TextStyle(
                        color: Colors.blue, 
                        fontSize: 25.0), 
                      textAlign: TextAlign.center,)
                  );
                }
                else {
                  dolarComercial = double.parse(snapshot.data["USD"]["bid"]);
                  dolarTurismo = double.parse(snapshot.data["USDT"]["bid"]);
                  euro = double.parse(snapshot.data["EUR"]["bid"]);
                  dolarCanadense = double.parse(snapshot.data["CAD"]["bid"]);
                  libraEsterlina = double.parse(snapshot.data["GBP"]["bid"]);
                  pesoArgentino = double.parse(snapshot.data["ARS"]["bid"]);
                  bitCoin = double.parse(snapshot.data["BTC"]["bid"]);
                  liteCoin = double.parse(snapshot.data["LTC"]["bid"]);
                  ieneJapones = double.parse(snapshot.data["JPY"]["bid"]);
                  francoSuico = double.parse(snapshot.data["CHF"]["bid"]);
                  dolarAustraliano = double.parse(snapshot.data["AUD"]["bid"]);

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          //,
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on, size: 75.0, color: Colors.blue),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on, size: 75.0, color: Colors.blue),

                              ],
                            )
                          ],
                        ),
                        Text("Informe os valores",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0
                            ),
                        ),
                        Divider(),
                        buildTextField("Real", "R\$", realController, _realChanged),
                        Divider(),
                        buildTextField("Dolar Comercial", "US\$", dolarComercialController, _dolarComercialChanged),
                        Divider(),
                        buildTextField("Dolar Turismo", "US\$", dolarTurismoController, _dolarTurismoChanged),
                        Divider(),
                        buildTextField("Dolar Canadense", "C\$", dolarCanadenseController, _dolarCanadenseChanged),
                        Divider(),
                        buildTextField("Dolar Australiano", "A\$", dolarAustralianoController, _dolarAustralianoChanged),
                        Divider(),
                        buildTextField("Euro", "€", euroController, _euroChanged),
                        Divider(),
                        buildTextField("Libra Esterlina", "£", libraEsterlinController, _libraEsterlinaChanged),
                        Divider(),
                        buildTextField("Peso Argentino", "\$", pesoArgentinoController, _pesoArgentinoChanged),
                        Divider(),
                        buildTextField("Ienes Japones", "¥", ienesJaponesController, _ienesJaponesChanged),
                        Divider(),
                        buildTextField("Franco Suiço", "Fr", francoSuicoController, _francoSuicoChanged),
                        Divider(),
                        buildTextField("Bit Coin", "\$\$\$", bitCoinController, _bitCoinChanged),
                        Divider(),
                        buildTextField("Lite Coin", "\$\$\$", liteCoinController, _liteCoinChanged),
                        Divider(),
                        Row(
                          //,
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on, size: 75.0, color: Colors.blue),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on, size: 75.0, color: Colors.blue),

                              ],
                            )
                          ],
                        )
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

Widget buildTextField(String label, String prefix, TextEditingController controller, Function function){
  return TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          //inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.blue),
            border: OutlineInputBorder(),
            prefixText: prefix,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            hintStyle: TextStyle(color: Colors.blue)
          ),
          onChanged: function,
  );
}
Future<Map> getData() async{

  http.Response response = await http.get(request2);
  return json.decode(response.body);
}
