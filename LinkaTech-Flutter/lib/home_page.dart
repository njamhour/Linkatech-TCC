import 'package:flutter/material.dart';
import 'package:linka_tech/tipo_pisada.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENTROU!"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        "LINKATECH",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
/*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/logo.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "LinkaTech",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nós somos da equipe da LinkaTech, estamos aqui para proporcionar um rendimento melhor, seja para você corredor, ou para que só deseja caminhar com mais conforto nos pés.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
               SizedBox(
                height: 40,
              ),
              Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
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
                        "Teste a sua pisada",
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
                        builder: (context) => TipoPisada(),
                      ),
                    );
                  },
                ),
              ),
            ),
              ],
            )
          ],
        ),
      ),
    );
  }      
}*/
