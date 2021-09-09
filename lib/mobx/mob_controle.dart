import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
part 'mob_controle.g.dart';

class Mob_Controle = _Mob_ControleBase with _$Mob_Controle;

abstract class _Mob_ControleBase with Store {
  @observable
  Jogo jogo = Jogo("sd");
}

class Jogo {
  String nick;
  String? nickOponete;
  int id = 0;
  List<List<int>> tab = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  Jogo(this.nick) {
    try {
      conecta();
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

  void conecta() {
    WebSocket.connect("ws://localhost:8080").then((sock) {
      //sock.add("Conectado");
      sock.listen(
        (message) {
          // print(message);
          chamadas(message, sock);
        },
      );
      readLine().listen((e) {
        processLine(e, sock);
      });
      //send(sock);
    }).catchError((err) {
      print("erro $err");
      exit(1);
    });
  }

  Future<void> send(sock) async {
    sock.add(stdin.readLineSync());
  }

  Stream<String> readLine() =>
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  void processLine(String line, sock) {
    sock.add(json.encode({'id': 'jogada', 'jogada': line}));
    //print(line);
  }
}
