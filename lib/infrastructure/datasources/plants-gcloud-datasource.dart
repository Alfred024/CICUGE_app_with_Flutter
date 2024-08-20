import 'dart:io';

import 'package:cicuge_app/config/config.dart';
import 'package:cicuge_app/domain/datasoruces/plants-datasource.dart';
import 'package:cicuge_app/domain/entities/plant-type.dart';
import 'package:cicuge_app/infrastructure/mappers/plant-mapper.dart';
import 'package:cicuge_app/infrastructure/models/plant-from-gcloud.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class PlantsGCloudDataSource extends PlantsDatasource {
  // TODO: Add api key to handle requests
  final dio = Dio(BaseOptions(
    baseUrl: Environment.googleCloudBucket,
    connectTimeout: const Duration(milliseconds: 8000),
    receiveTimeout: const Duration(milliseconds: 8000),
  ));

  @override
  Future<PlantType> getPlantType({File? file}) async {
    if (file == null) {
      print('Debes subir un archivo para analizar');
      // throw UnimplementedError('Debes subir un archivo para analizar');
    }

    print('ARCHIVO OBTENIDO EN EL DATASOURCE: $file');
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file!.path,
        filename: file.path.split('/').last,
      ),
    });

    print('LA REQUEST SE ENVIARÁ ASÍ $formData');

    try {
      final response = await dio.post('predict', data: formData);
      print('La respuesta es');
      print(response);
      final plant =
          PlantTypeMapper.gClooudResponseToEntity(response as PlantFromGCloud);
      return plant;
    } catch (e) {
      print('Ocurrió un error en el request a gcloud: $e');
      throw UnimplementedError('Ocurrió un error en el request a gcloud: $e');
    }
  }
}
