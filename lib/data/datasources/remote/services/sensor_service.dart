import 'dart:convert';

import 'package:learn_sqflite/core/constants/app_constant.dart';
import 'package:learn_sqflite/domain/models/sensor.dart';
import 'package:http/http.dart' as http;

class SensorService {
  Future<Sensor?> fetchLatestMoisture() async {
    try {
      final response = await http.get(
        Uri.parse("${AppConstant.ApiServerUrl}api/moisture"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Sensor.fromJson(data["data"]);
      } else {
        print("Failed to fetch data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
