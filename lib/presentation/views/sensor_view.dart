import 'package:flutter/material.dart';
import 'package:learn_sqflite/presentation/viewmodels/sensor_viewmodel.dart';
import 'package:provider/provider.dart';

class SensorView extends StatefulWidget {
  @override
  _SensorViewState createState() => _SensorViewState();
}

class _SensorViewState extends State<SensorView> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<SensorViewModel>(context, listen: false);
    vm.startFetchingRealtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moisture Realtime")),
      body: Consumer<SensorViewModel>(
        builder: (context, vm, _) {
          final data = vm.sensor;
          if (data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data.moisture?.toStringAsFixed(1)}%",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Diperbarui: ${data.createdAt?.toLocal().toString() ?? '---'}",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
