import 'dart:io';

import 'package:cicuge_app/domain/datasoruces/plants-datasource.dart';
import 'package:cicuge_app/domain/entities/plant-type.dart';
import 'package:cicuge_app/domain/repositories/plants-repositiry.dart';

class PlantsRepositoryImpl extends PlantsRepository {
  final PlantsDatasource plantsDatasource;

  PlantsRepositoryImpl(this.plantsDatasource);

  @override
  Future<PlantType> getPlantType({File? file}) {
    return plantsDatasource.getPlantType(file: file);
  }
}
