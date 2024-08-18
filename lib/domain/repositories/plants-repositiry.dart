import 'dart:io';

import 'package:cicuge_app/domain/entities/plant-type.dart';

abstract class PlantsRepository {
  Future<PlantType> getPlantType({File? file});
}
