import 'package:flutter/material.dart';
import 'package:velha/velha.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [Velha(), Container(color: Colors.amber)],
    );
  }
}
