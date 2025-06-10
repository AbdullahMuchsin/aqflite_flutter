import 'package:learn_sqflite/data/dao/sensor_dao.dart';
import 'package:learn_sqflite/data/datasources/remote/services/sensor_service.dart';
import 'package:learn_sqflite/domain/models/sensor.dart';
import 'package:learn_sqflite/domain/repositories/sensor_repository.dart';

class SensorRepositoryImpl implements SensorRepository {
  final SensorDao sensorDao = SensorDao();
  final SensorService sensorService = SensorService();

  @override
  Future<List<Sensor>> getAllSensor() => sensorDao.getAllSensor();

  @override
  Future<int> addSensor(Sensor sensor) => sensorDao.addSensor(sensor);

  @override
  Future<int> updateSensor(Sensor sensor) => sensorDao.updateSensor(sensor);

  @override
  Future<int> deleteSensor(int idSensor) => sensorDao.deleteSensor(idSensor);

  Future<Sensor?> getLatestMoisture() => sensorService.fetchLatestMoisture();
}
