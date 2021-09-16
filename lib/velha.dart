import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'mobx/mob_controle.dart';

class Velha extends StatefulWidget {
  const Velha({Key? key}) : super(key: key);

  @override
  _VelhaState createState() => _VelhaState();
}

final Mob_Controle mob = GetIt.I<Mob_Controle>();

List<List<int>> tab = [
  [0, 0, 0],
  [1, 2, 0],
  [0, 0, 1]
];
String oponente = "marcy";

class _VelhaState extends State<Velha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oponente: " + mob.jogo.nickOponete!),
        centerTitle: true,
      ),
      body: Center(
        child: Observer(builder: (_) {
          return Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...Iterable<int>.generate(mob.jogo.tab.length).map((int x) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...Iterable<int>.generate(mob.jogo.tab.length)
                            .map((int i) {
                          return BotaoCuston(
                              valor: mob.jogo.tab[x][i],
                              func: () {
                                mob.jogo.processLine('$x $i');
                                print('$x $i');
                              });
                        })
                      ],
                    );
                  }),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                          onPressed: () {}, child: Text("jogar novamente")),
                      FlatButton(
                          onPressed: () {}, child: Text("Sair da partida")),
                    ],
                  )
                ]),
          );
        }),
      ),
    );
  }
}

class BotaoCuston extends StatelessWidget {
  int valor;
  Function func;
  BotaoCuston({
    Key? key,
    required this.valor,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: valor == 0
            ? Colors.white
            : valor == 1
                ? Colors.blue[100]
                : Colors.red[100],
        child: InkWell(
          onTap: () {
            func();
          },
          child: Container(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              valor == 0
                  ? ""
                  : valor == 1
                      ? "X"
                      : "O",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
