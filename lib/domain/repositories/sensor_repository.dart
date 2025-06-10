import 'package:learn_sqflite/domain/models/sensor.dart';

abstract class SensorRepository {
  Future<List<Sensor>> getAllSensor();
  Future<int> updateSensor(Sensor sensor);
  Future<int> addSensor(Sensor sensor);
  Future<int> deleteSensor(int idUser);

  Future<Sensor?> getLatestMoisture();
}
