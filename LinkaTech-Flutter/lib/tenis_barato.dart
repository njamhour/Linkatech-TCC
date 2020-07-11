import 'package:flutter/material.dart';

class TenisBaratoPage extends StatelessWidget {
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
                        child: Image.asset("images/tenis_barato.jpg"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tênis Asics Gel-Excite 6A",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "O foco do Asics Excite é a estabilidade, devido a isso merece um lugar entre os melhores. Bom, bonito e barato. É a opção certa para melhorar o desempenho nas corridas e caminhadas, mas não quer gastar muito.",
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
                        "Preço: 169,99 Reais",
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