import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
part 'mob_controle.g.dart';

class Mob_Controle = _Mob_Controle with _$Mob_Controle;

abstract class _Mob_Controle with Store {
  @observable
  int page = 0;
  @observable
  bool espera = false;
  @observable
  String nick = "";
  @observable
  int vez = 0;
  @observable
  dynamic jogo = "";
  @observable
  bool fin = false;
  @observable
  int pontos_x = 0;
  @observable
  int pontos_o = 0;

  @action
  void strat() {
    pontos_o = 0;
    pontos_x = 0;
    tab = ObservableList<ObservableList<int>>.of([
      ObservableList.of([0, 0, 0]),
      ObservableList.of([0, 0, 0]),
      ObservableList.of([0, 0, 0]),
    ]);
    try {
      conecta();
      jogo = 556;
      print("conectado");
    } catch (e) {
      print("não conectado");
    }
  }

  @observable
  String? nickOponete;
  WebSocket? soc;
  @observable
  int id = 0;
  @observable
  var tab = ObservableList<ObservableList<int>>.of([
    ObservableList.of([0, 0, 0]),
    ObservableList.of([0, 0, 0]),
    ObservableList.of([0, 0, 0]),
  ]);

  @action
  void setTab(x, y, valo) {
    tab[x][y] = valo;
  }

  void desenha() {
    print("oponente é $nickOponete");
    print('');
    if (id == 1) {
      print('vc é o X');
    }
    if (id == 2) {
      print('vc é o O');
    }

    stdout.write('  0 1 2');
    print('');
    for (var i = 0; i < tab.length; i++) {
      for (var j = 0; j < tab.length; j++) {
        if (j == 0) {
          stdout.write(i.toString() + " ");
        }
        if (tab[i][j] == 1) {
          stdout.write('X' + ' ');
        } else if (tab[i][j] == 2) {
          stdout.write('O' + ' ');
        } else {
          stdout.write('-' + ' ');
        }
      }
      print('');
    }
  }

  void chamadas(msns, sock) {
    var msn = json.decode(msns);
    if (msn['id'] == "id") {
      id = (msn['ident']);
      sock.add(json.encode({'id': 'nick', 'nick': nick}));
    }
    if (msn['id'] == "nickOP") {
      nickOponete = msn['nick'];
      print("oponente é $nickOponete");
      page = 1;
    }
    if (msn['id'] == 'vez') {
      vez = msn['vez'];
      if (id == msn['vez']) {
        print("Sua vez");
      } else {
        print("Vez do oponete");
      }
    }
    if (msn['id'] == "erro") {
      print(msn['erro']);
    }
    if (msn['id'] == 'desenha') {
      desenha();
    }
    if (msn['id'] == 'att') {
      tab[msn['x']][msn['y']] = msn['marc'];
      setTab(msn['x'], msn['y'], msn['marc']);
    }
    if (msn['id'] == 'fim') {
      print(msn['msn']);
      fin = true;
    }
    if (msn['id'] == 'reset') {
      fin = false;

      vez = msn['vez'];
      tab = ObservableList<ObservableList<int>>.of([
        ObservableList.of([0, 0, 0]),
        ObservableList.of([0, 0, 0]),
        ObservableList.of([0, 0, 0]),
      ]);
    }
    if (msn['id'] == 'pontos') {
      pontos_o = msn['o'];
      pontos_x = msn['x'];
    }
  }

  Future<void> conecta() async {
    WebSocket.connect("ws://186.207.129.17:8080").then((sock) {
      print("tenta");
      //sock.add("Conectado");
      soc = sock;
      sock.listen(
        (message) {
          // print(message);

          chamadas(message, sock);
        },
      );
      /*readLine().listen((e) {
        processLine(e, sock);
      });*/
      //send(sock);
    }).catchError((err) {
      print("erro ");
      exit(1);
    });
  }

  Future<void> send(sock) async {
    sock.add(stdin.readLineSync());
  }

  Stream<String> readLine() =>
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  void processLine(String line) {
    soc!.add(json.encode({'id': 'jogada', 'jogada': line}));
    //print(line);
  }

  void processReset() {
    soc!.add(json.encode({'id': 'reset'}));
    //print(line);
  }

  @action
  void setNick(String valor) => nick = valor;
}
/*
class Jogo {
  @observable
  String nick;
  @observable
  String? nickOponete;
  WebSocket? soc;
  int id = 0;
  @observable
  List<List<int>> tab = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  Jogo(this.nick) {
    try {
      conecta();
      print("conectado");
    } catch (e) {
      print("não conectado");
    }
  }
  void desenha() {
    print("oponente é $nickOponete");
    print('');
    if (id == 1) {
      print('vc é o X');
    }
    if (id == 2) {
      print('vc é o O');
    }

    stdout.write('  0 1 2');
    print('');
    for (var i = 0; i < tab.length; i++) {
      for (var j = 0; j < tab.length; j++) {
        if (j == 0) {
          stdout.write(i.toString() + " ");
        }
        if (tab[i][j] == 1) {
          stdout.write('X' + ' ');
        } else if (tab[i][j] == 2) {
          stdout.write('O' + ' ');
        } else {
          stdout.write('-' + ' ');
        }
      }
      print('');
    }
  }

  void chamadas(msns, sock) {
    var msn = json.decode(msns);
    if (msn['id'] == "id") {
      id = (msn['ident']);
      sock.add(json.encode({'id': 'nick', 'nick': nick}));
    }
    if (msn['id'] == "nickOP") {
      nickOponete = msn['nick'];
      print("oponente é $nickOponete");
    }
    if (msn['id'] == 'vez') {
      if (id == msn['vez']) {
        print("Sua vez");
      } else {
        print("Vez do oponete");
      }
    }
    if (msn['id'] == "erro") {
      print(msn['erro']);
    }
    if (msn['id'] == 'desenha') {
      desenha();
    }
    if (msn['id'] == 'att') {
      tab[msn['x']][msn['y']] = msn['marc'];
    }
  }

  Future<void> conecta() async {
    WebSocket.connect("ws://192.168.100.65:8080").then((sock) {
      print("tenta");
      //sock.add("Conectado");
      soc = sock;
      sock.listen(
        (message) {
          // print(message);

          chamadas(message, sock);
        },
      );
      /*readLine().listen((e) {
        processLine(e, sock);
      });*/
      //send(sock);
    }).catchError((err) {
      print("erro ");
      exit(1);
    });
  }

  Future<void> send(sock) async {
    sock.add(stdin.readLineSync());
  }

  Stream<String> readLine() =>
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  void processLine(String line) {
    soc!.add(json.encode({'id': 'jogada', 'jogada': line}));
    //print(line);
  }
}
*/