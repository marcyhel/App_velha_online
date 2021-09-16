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
      body: Container(
        //color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(builder: (_) {
                return Column(
                  children: [
                    Text("Digite seu Nick"),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Flexible(child: TextField(
                          onChanged: (e) {
                            mob.setNick(e);
                          },
                        ))),
                  ],
                );
              }),
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
    );
  }
}
