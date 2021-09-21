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
        title:
            mob.jogo == "" ? Text("") : Text("Oponente: " + mob.nickOponete!),
        centerTitle: true,
      ),
      body: Center(
        child: Observer(builder: (_) {
          return mob.jogo == ""
              ? Container()
              : Container(
                  child: Observer(builder: (_) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (mob.id == 1)
                              ? Text(
                                  "vc é o X",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )
                              : Text(
                                  "vc é o O",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                          Pontos(),
                          SizedBox(
                            height: 20,
                          ),
                          (mob.id == mob.vez)
                              ? Text(
                                  "Sua vez",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )
                              : Text(
                                  "vez do oponente",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                          SizedBox(
                            height: 50,
                          ),
                          ...Iterable<int>.generate(mob.tab.length)
                              .map((int x) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...Iterable<int>.generate(mob.tab.length)
                                    .map((int i) {
                                  return BotaoCuston(
                                      valor: mob.tab[x][i],
                                      func: () {
                                        mob.processLine('$x $i');
                                        setState(() {});
                                        print('$x $i');
                                      });
                                })
                              ],
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton(
                                  onPressed: () {
                                    mob.processReset();
                                  },
                                  child: Text("jogar novamente")),
                              FlatButton(
                                  onPressed: () {
                                    mob.page = 0;
                                  },
                                  child: Text("Sair da partida")),
                            ],
                          )
                        ]);
                  }),
                );
        }),
      ),
    );
  }
}

class Pontos extends StatelessWidget {
  const Pontos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "X",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                mob.pontos_x.toString(),
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "O",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                mob.pontos_o.toString(),
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          )
        ],
      );
    });
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
    return Observer(builder: (_) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
    });
  }
}
