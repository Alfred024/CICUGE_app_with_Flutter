import 'package:cicuge_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:cicuge_app/presentation/screens/screens.dart';
import 'package:cicuge_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().colorLightAppScheme.primary,
        title: Text('Bienvenido a la App de CICUGE',
            style: AppTheme().appTextTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            CustomFilledButton(
              text: 'Analizar tipo de cultivo',
              radius: const Radius.circular(20),
              icon: const Icon(Icons.grass),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantTypeScreen()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomFilledButton(
              text: 'Analizar estado de la planta',
              radius: const Radius.circular(20),
              icon: const Icon(Icons.local_florist),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantDesesaeScreen()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomFilledButton(
              text: 'Analizar semillas',
              radius: const Radius.circular(20),
              icon: const Icon(Icons.spa),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeedsStateScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
