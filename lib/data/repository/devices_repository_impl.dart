import 'package:learn_sqflite/data/dao/devices_dao.dart';
import 'package:learn_sqflite/domain/models/device.dart';
import 'package:learn_sqflite/domain/repositories/devices_repository.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  DevicesDao devicesDao = DevicesDao();

  @override
  Future<List<Device>> getAllDevices() => devicesDao.getAllDevices();

  @override
  Future<int> addDevice(Device device) => devicesDao.addDevice(device);
  
  @override
  Future<int> updateDevice(Device device) => devicesDao.updateDevice(device);
  
  @override
  Future<int> deleteDevice(int idDevice) => devicesDao.deleteDevice(idDevice);
}
