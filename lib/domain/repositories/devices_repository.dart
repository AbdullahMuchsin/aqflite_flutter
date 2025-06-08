import 'package:learn_sqflite/domain/models/device.dart';

abstract class DevicesRepository {
  Future<List<Device>> getAllDevices();
  Future<int> addDevice(Device device);
  Future<int> updateDevice(Device device);
  Future<int> deleteDevice(int idDevice);
}
