import 'package:flutter/material.dart';
import 'package:linka_tech/tenis.dart';

class SelectorPage extends StatelessWidget {
  final List<String> _marca = [
    "Nike", "Adidas", "NewBalance", "Asics", "Puma", "Mizuno"
  ]; 
  final List<String> _preco = [
    "100,00", "200,00", "300,00", "400,00", "500,00", "600,00", "700,00", "800,00", "900,00", "1000,00"
  ]; 
  final List<String> _tamanho = [
    "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44"
  ]; 
  final List<String> _pisada = [
    "Supinada", "Neutra", "Pronada",
  ]; 
  final List<String> _genero = [
    "Masculino", "Feminino",
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
        DropdownButton(
          items: _marca
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('Marca'),
          value: null,
        ),
         SizedBox(
              height: 20,
            ),
        DropdownButton(
          items: _preco
              .map((String dropDownStringItem) {
                  return DropdownMenuItem<String> (
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('Preço'),
          value: null,
        ),
         SizedBox(
              height: 20,
            ),
        DropdownButton(
          items: _tamanho
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('Tamanho'),
          value: null,
        ),
        SizedBox(
              height: 20,
            ),
          DropdownButton(
          items: _pisada
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('Pisada'),
          value: null,
        ),
        SizedBox(
              height: 20,
            ),
         DropdownButton(
          items: _genero
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('Gênero'),
          value: null,
        ),
         SizedBox(
              height: 20,
            ),
         Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Color(0xFF0a0a0a),
                              Color(0xFF0a0a0a),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Selecione o seu calçado",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenisPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
      ),
    ),
    );
  }
}