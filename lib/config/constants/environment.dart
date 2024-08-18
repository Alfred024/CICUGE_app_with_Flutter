import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String cloudBucketPredictType =
      dotenv.env['GOOGLE_CLOUD_PLANT_TYPE'] ?? 'No está configurado la API_URL';

  static String cloudBucketPredictDesase =
      dotenv.env['GOOGLE_CLOUD_PLANT_DESEASE'] ??
          'No está configurado la API_URL';

  static String cloudBucketPredictSeedState =
      dotenv.env['GOOGLE_CLOUD_SEEDS_STATE'] ??
          'No está configurado la API_URL';

  static String googleCloudBucket =
      dotenv.env['GOOGLE_CLOUD_BUCKET'] ?? 'No está configurado la API_URL';
}
