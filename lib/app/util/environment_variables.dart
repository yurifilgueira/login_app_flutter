import 'package:flutter_dotenv/flutter_dotenv.dart';

const String flavor = String.fromEnvironment('FLAVOR');

final variables = {
  'baseUrl': dotenv.env['LOGIN_APP_API_BASE_URL'],
};

Map<String, dynamic> get environment {
  return variables;
}