// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_controle.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Controle on _Mob_Controle, Store {
  final _$nickAtom = Atom(name: '_Mob_Controle.nick');

  @override
  String? get nick {
    _$nickAtom.reportRead();
    return super.nick;
  }

  @override
  set nick(String? value) {
    _$nickAtom.reportWrite(value, super.nick, () {
      super.nick = value;
    });
  }

  final _$jogoAtom = Atom(name: '_Mob_Controle.jogo');

  @override
  Jogo get jogo {
    _$jogoAtom.reportRead();
    return super.jogo;
  }

  @override
  set jogo(Jogo value) {
    _$jogoAtom.reportWrite(value, super.jogo, () {
      super.jogo = value;
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
nick: ${nick},
jogo: ${jogo}
    ''';
  }
}
