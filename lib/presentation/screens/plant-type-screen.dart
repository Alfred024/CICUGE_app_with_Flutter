import 'dart:io';

import 'package:cicuge_app/presentation/providers/plants_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:cicuge_app/config/config.dart';
import 'package:cicuge_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PlantTypeScreen extends ConsumerStatefulWidget {
  const PlantTypeScreen({super.key});

  @override
  PlantTypeScreenState createState() => PlantTypeScreenState();
}

class PlantTypeScreenState extends ConsumerState<PlantTypeScreen> {
  @override
  void initState() {
    super.initState();
    // ref.read(typePlantProvider.notifier).getPlant();
  }

  File? imageFile;

  Future<void> _selectImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 100);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _sendImageFile(File? imageFile) async {
    if (imageFile == null) {
      print('No hay archivo, no llamaré al provider');
      return;
    }
    print('Llamado al método del provider para traer la planta');
    ref.read(typePlantProvider.notifier).getPlant(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    try {
      final plantType = ref.watch(typePlantProvider);
      print('LA PLANT TYPE ES: $plantType');
    } catch (e) {
      print('Error message: ${e}');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().colorLightAppScheme.primary,
        title: Text(
          'Evaluar el tipo de planta',
          style: AppTheme().appTextTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          imageFile == null
              ? Image.asset(
                  '/assets/images/upload-img-svg.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  imageFile!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomFilledButton(
                  text: 'Subir archivo de imagen',
                  radius: const Radius.circular(20),
                  icon: const Icon(Icons.camera),
                  onPressed: () {
                    _selectImage(ImageSource.gallery);
                  },
                ),
                CustomFilledButton(
                  text: 'Analizar el archivo',
                  radius: const Radius.circular(20),
                  icon: const Icon(Icons.send_and_archive),
                  onPressed: () {
                    _sendImageFile(imageFile);
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
