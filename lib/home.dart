import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:velha/mobx/mob_controle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final Mob_Controle mob = GetIt.I<Mob_Controle>();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(mob.nick);
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Observer(builder: (_) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Digite seu Nick",
                        style: TextStyle(fontSize: 30, color: Colors.black38),
                      ),
                      SizedBox(height: 50),
                      TextImputDado(),
                      SizedBox(height: 50),
                    ],
                  );
                }),
                SizedBox(height: 50),
                FlatButton(
                  onPressed: () {
                    mob.strat();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text("Procurar Partida"),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextImputDado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isDense: true,
          //border: InputBorder.none,
        ),
        onChanged: (valor) {
          mob.setNick(valor);
        },
      ),
    );
  }
}
