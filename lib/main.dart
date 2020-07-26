import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heigthController = new TextEditingController();
  String _infoText = "Informe seus dados!";

  void _calculate(){
    setState((){
     double weight = double.parse(weightController.text);
     double heigth = double.parse(heigthController.text) / 100;
     double imc = weight / (heigth * heigth);
     print(imc);

      if(imc < 18.6){
       _infoText = "Abaixo do peso! (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal! (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso! (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I! (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II! (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 40){
        _infoText = "Obesidade Grau III! (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  void _resetField(){
    setState((){
      weightController.text = "";
      heigthController.text = "";
      _infoText = "Informe seus Dados!";
    });
  }
  
  //OVERRIDE-------------------------------------------------------------------------
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
            onPressed: () { _resetField(); },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Icon(Icons.person_outline, size: 120.00, color: Colors.green,),
         
         //Campo para o dado de peso do usuário
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Peso (kg)", labelStyle: TextStyle(color: Colors.green, fontSize: 20),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 30),
            controller: weightController,
          ),

          //Campo para o dado de altura do usuário
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Altura (cm)", labelStyle: TextStyle(color: Colors.green, fontSize: 20)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 30),
            controller: heigthController,
          ),

          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () { _calculate(); },
                color: Colors.green,
                child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
            ),
          ),
          Text("$_infoText", textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0))
        ],),
      ),
    );
  }
}