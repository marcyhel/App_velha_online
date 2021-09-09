import 'package:flutter/material.dart';

class Velha extends StatefulWidget {
  const Velha({Key? key}) : super(key: key);

  @override
  _VelhaState createState() => _VelhaState();
}

List<List<int>> tab = [
  [0, 0, 0],
  [1, 0, 0],
  [0, 0, 1]
];
String oponente = "marcy";

class _VelhaState extends State<Velha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oponente: " + oponente),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...Iterable<int>.generate(tab.length).map((int x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...Iterable<int>.generate(tab.length).map((int i) {
                        return BotaoCuston(valor: tab[x][i]);
                      })
                    ],
                  );
                })
              ]),
        ),
      ),
    );
  }
}

class BotaoCuston extends StatelessWidget {
  int valor;
  BotaoCuston({
    Key? key,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: valor == 0 ? Colors.white : Colors.blue[100],
        child: InkWell(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                borderRadius: BorderRadius.circular(5)),
            child: Center(child: Text(valor.toString())),
          ),
        ),
      ),
    );
  }
}
