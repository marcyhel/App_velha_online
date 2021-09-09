// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_controle.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Controle on _Mob_ControleBase, Store {
  final _$jogoAtom = Atom(name: '_Mob_ControleBase.jogo');

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

  @override
  String toString() {
    return '''
jogo: ${jogo}
    ''';
  }
}
