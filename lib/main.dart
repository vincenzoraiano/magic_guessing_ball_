import 'dart:math';

import 'package:flutter/material.dart';

//punto di ingresso dell'app.
void main() => runApp(
      MaterialApp(
        home: MagicBall(),
      ),
    );

//creo una classe immutabile che costituira il corpo dell'app
class MagicBall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Un semplice scaffold che contiene un app bar e un testo centrato.
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Text('Chiedimi Qualcosa'),
        centerTitle: true,
      ),
      //il corpo dell'app estend un statefull class che esegue l'app e trasforma il corpo della
      body: Ball(),
    );
  }
}

//creo un metodo statfull che cambia aspetto all'app e da una logica ai processi.
class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  //variabile che detrmina l'immagine da usare
  int cambiastato = 1;

  //creo il metodo che gestisce lo il cambiamento di stato dell'app
  void rispostaPalla() {
    //il metodo set state rende effettivo il cambiamento dell'app.
    setState(() {
      //viene generato il numero random assegnato alla variabile immagine
      cambiastato = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //Tasto interattovo
            child: FlatButton(
              //inserisco un metodo on pressed che conferisce l'iteratività al bottone creato.
              onPressed: () {
                rispostaPalla();
                print('Stato cambiato');
              },
              child: Image.asset('images/ball$cambiastato.png'),
            ),
          )
        ],
      ),
    );
  }
}
