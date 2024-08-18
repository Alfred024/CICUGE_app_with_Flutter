import 'dart:io';

import 'package:cicuge_app/config/config.dart';
import 'package:cicuge_app/domain/datasoruces/plants-datasource.dart';
import 'package:cicuge_app/domain/entities/plant-type.dart';
import 'package:cicuge_app/infrastructure/mappers/plant-mapper.dart';
import 'package:cicuge_app/infrastructure/models/plant-from-gcloud.dart';
import 'package:dio/dio.dart';

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
      throw UnimplementedError('Debes subir un archivo para analizar');
    }

    try {
      final response = await dio.post(
        'predict',
      );
      final plant =
          PlantTypeMapper.gClooudResponseToEntity(response as PlantFromGCloud);
      return plant;
    } catch (e) {
      throw UnimplementedError('Ocurrió un error en el request a gcloud: $e');
    }
  }
}
