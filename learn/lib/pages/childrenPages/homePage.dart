import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ChildrenHomePage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        pagePosition: pagePosition.value,
        children: const [
          Text('Home', style: TextStyle(color: Colors.white)),
        ] 
      ),
      body: const Center(
        child: Text('Página da Home das Crianças'),
      ),
    );
  }
}