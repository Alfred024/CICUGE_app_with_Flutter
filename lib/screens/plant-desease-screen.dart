import 'package:flutter/material.dart';

class PlantDesesaeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado de la Planta'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Página de análisis del estado de la planta',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
