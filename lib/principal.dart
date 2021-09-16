import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:velha/home.dart';
import 'package:velha/velha.dart';

import 'mobx/mob_controle.dart';

class Principal extends StatefulWidget {
  PageController _controle = PageController(initialPage: 0);
  Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}
final Mob_Controle mob = GetIt.I<Mob_Controle>();
class _PrincipalState extends State<Principal> {
   void initState() {
    // TODO: implement initState
    reaction<int>(
      (fn) => mob.page,
      (valor) => widget._controle.animateToPage(valor,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOutQuart),
    );
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
 physics: NeverScrollableScrollPhysics(),
        controller: widget._controle,
      children: [Home(),Velha(),  Container(color: Colors.amber)],
    );
  }
}
