import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cicuge_app/infrastructure/datasources/plants-gcloud-datasource.dart';
import 'package:cicuge_app/infrastructure/repositories/plants-repositiry-impl.dart';
import 'package:cicuge_app/domain/entities/plant-type.dart';

final plantsRepositoryProvider = Provider((ref) {
  return PlantsRepositoryImpl(PlantsGCloudDataSource());
});

final typePlantProvider =
    StateNotifierProvider<PlantsNotifier, PlantType>((ref) {
  final getPlantType = ref.watch(plantsRepositoryProvider).getPlantType;
  return PlantsNotifier(fetchPlant: getPlantType);
});

typedef PlantCallback = Future<PlantType> Function({File? file});

class PlantsNotifier extends StateNotifier<PlantType> {
  PlantCallback fetchPlant;
  File? currentFile;
  bool isLoading = false;

  PlantsNotifier({required this.fetchPlant})
      : super(PlantType(type: 'type', confidence: 100));

  Future<void> getPlant() async {
    if (isLoading) return;

    isLoading = true;
    currentFile = currentFile;
    final plant = await fetchPlant();
    state = plant;
    // Simula efecto de carga
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }
}
