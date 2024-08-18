import 'package:flutter/material.dart';

class SeedsStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analizar Semillas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Página de análisis de semillas',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
