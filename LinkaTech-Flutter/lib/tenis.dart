import 'package:flutter/material.dart';

class TenisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/tenis.jpg"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Asics Gel Kayano 24 Corrida",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Ainda mais moderna, a versão 24 do Kayano traz um novo cabedal, que oferece maior sustentação aos pés. Combinado a isso, o amortecimento GEL da Asics, já bastante conceituado, proporciona maciez e conforto.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal
                        ),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
                    
                    SizedBox(
                      height: 60,
                   ),

                    Text(
                        "Preço: 507,00 Reais",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),  
             SizedBox(
              height: 10,
            ),
          ],
        )
    )
  );
 }
}