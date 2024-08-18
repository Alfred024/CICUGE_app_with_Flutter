import 'package:cicuge_app/domain/entities/plant-type.dart';
import 'package:cicuge_app/infrastructure/models/plant-from-gcloud.dart';

class PlantTypeMapper {
  static gClooudResponseToEntity(PlantFromGCloud response) =>
      PlantType(type: response.plantClass, confidence: response.confidence);
}
