import 'dart:io';

import 'package:cicuge_app/domain/entities/plant-type.dart';

abstract class PlantsDatasource {
  Future<PlantType> getPlantType({File? file});
}
