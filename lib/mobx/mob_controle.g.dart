// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_controle.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Controle on _Mob_Controle, Store {
  final _$pageAtom = Atom(name: '_Mob_Controle.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$esperaAtom = Atom(name: '_Mob_Controle.espera');

  @override
  bool get espera {
    _$esperaAtom.reportRead();
    return super.espera;
  }

  @override
  set espera(bool value) {
    _$esperaAtom.reportWrite(value, super.espera, () {
      super.espera = value;
    });
  }

  final _$nickAtom = Atom(name: '_Mob_Controle.nick');

  @override
  String get nick {
    _$nickAtom.reportRead();
    return super.nick;
  }

  @override
  set nick(String value) {
    _$nickAtom.reportWrite(value, super.nick, () {
      super.nick = value;
    });
  }

  final _$vezAtom = Atom(name: '_Mob_Controle.vez');

  @override
  int get vez {
    _$vezAtom.reportRead();
    return super.vez;
  }

  @override
  set vez(int value) {
    _$vezAtom.reportWrite(value, super.vez, () {
      super.vez = value;
    });
  }

  final _$jogoAtom = Atom(name: '_Mob_Controle.jogo');

  @override
  dynamic get jogo {
    _$jogoAtom.reportRead();
    return super.jogo;
  }

  @override
  set jogo(dynamic value) {
    _$jogoAtom.reportWrite(value, super.jogo, () {
      super.jogo = value;
    });
  }

  final _$nickOponeteAtom = Atom(name: '_Mob_Controle.nickOponete');

  @override
  String? get nickOponete {
    _$nickOponeteAtom.reportRead();
    return super.nickOponete;
  }

  @override
  set nickOponete(String? value) {
    _$nickOponeteAtom.reportWrite(value, super.nickOponete, () {
      super.nickOponete = value;
    });
  }

  final _$idAtom = Atom(name: '_Mob_Controle.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$tabAtom = Atom(name: '_Mob_Controle.tab');

  @override
  ObservableList<ObservableList<int>> get tab {
    _$tabAtom.reportRead();
    return super.tab;
  }

  @override
  set tab(ObservableList<ObservableList<int>> value) {
    _$tabAtom.reportWrite(value, super.tab, () {
      super.tab = value;
    });
  }

  final _$_Mob_ControleActionController =
      ActionController(name: '_Mob_Controle');

  @override
  void strat() {
    final _$actionInfo = _$_Mob_ControleActionController.startAction(
        name: '_Mob_Controle.strat');
    try {
      return super.strat();
    } finally {
      _$_Mob_ControleActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTab(dynamic x, dynamic y, dynamic valo) {
    final _$actionInfo = _$_Mob_ControleActionController.startAction(
        name: '_Mob_Controle.setTab');
    try {
      return super.setTab(x, y, valo);
    } finally {
      _$_Mob_ControleActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNick(String valor) {
    final _$actionInfo = _$_Mob_ControleActionController.startAction(
        name: '_Mob_Controle.setNick');
    try {
      return super.setNick(valor);
    } finally {
      _$_Mob_ControleActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
espera: ${espera},
nick: ${nick},
vez: ${vez},
jogo: ${jogo},
nickOponete: ${nickOponete},
id: ${id},
tab: ${tab}
    ''';
  }
}
