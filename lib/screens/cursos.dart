import 'package:flutter/material.dart';

class Cursos extends StatefulWidget {
  const Cursos({super.key});

  @override
  State<Cursos> createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Cursos'),
    );
  }
}