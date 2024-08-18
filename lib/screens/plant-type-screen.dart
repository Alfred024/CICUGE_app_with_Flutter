import 'package:flutter/material.dart';

class PlantTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Cultivo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Página de análisis de tipo de cultivo',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
