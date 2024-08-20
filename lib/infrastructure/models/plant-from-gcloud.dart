class PlantFromGCloud {
  PlantFromGCloud({
    required this.plantClass,
    required this.confidence,
  });

  final String plantClass;
  final double confidence;

  factory PlantFromGCloud.fromJson(Map<String, dynamic> json) =>
      PlantFromGCloud(
          plantClass: json['plant_class'], confidence: json['confidence']);

  Map<String, dynamic> toJson() =>
      {"plant_class": plantClass, "confidence": confidence};
}
