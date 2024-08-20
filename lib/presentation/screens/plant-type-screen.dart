import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cicuge_app/domain/entities/plant-type.dart';
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
  }

  File? imageFile;
  bool plantTypeFetched = false;

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
      return;
    }
    ref.read(typePlantProvider.notifier).getPlant(imageFile);
    plantTypeFetched = true;
  }

  @override
  Widget build(BuildContext context) {
    final plantType = ref.watch(typePlantProvider);

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
              ? Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuYrruv4mBYER13NGEO_CDqMR8HKxOj60yiw&s',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2.0,
                    );
                  } else {
                    return FadeIn(child: child);
                  }
                })
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    imageFile!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          if (plantTypeFetched) Text(plantType.type),
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
