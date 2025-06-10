import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:learn_sqflite/data/repository/sensor_repository_impl.dart';
import 'package:learn_sqflite/domain/models/sensor.dart';

class SensorViewModel extends ChangeNotifier {
  final SensorRepositoryImpl _repositoryImpl = SensorRepositoryImpl();

  Sensor? _sensor;
  Sensor? get sensor => _sensor;

  Timer? _timer;

  void startFetchingRealtime({
    Duration interval = const Duration(seconds: 5),
  }) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => fetchLatest());
    fetchLatest(); // immediate fetch
  }

  void fetchLatest() async {
    final result = await _repositoryImpl.getLatestMoisture();
    if (result != null) {
      _sensor = result;
      notifyListeners();
    }
  }

  void stopFetching() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
