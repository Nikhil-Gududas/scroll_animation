import 'package:flutter/material.dart';
import '../models/character.dart';

class ShrinkTopList extends StatelessWidget {
  const ShrinkTopList({super.key});
  static const routeName = 'Shrink-Top-List';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shrink Top List')),
      body: CustomScrollView(),
    );
  }
}
