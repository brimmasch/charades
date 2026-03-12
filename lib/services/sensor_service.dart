import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sensors_plus/sensors_plus.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

class AccelSample {
  final double x;
  final double y;
  final double z;
  const AccelSample(this.x, this.y, this.z);
}

class SensorService {
  // Raw accelerometer stream. Phone held horizontal in landscapeLeft against
  // forehead, screen facing audience: X≈10 (gravity), Y≈0, Z≈0.
  // Forward tilt (GOT IT) drives Z negative; backward tilt (PASS) drives Z positive.
  static Stream<AccelSample> get accelStream {
    if (kIsWeb) return const Stream.empty();
    return accelerometerEventStream(
      samplingPeriod: SensorInterval.gameInterval,
    ).map((e) => AccelSample(e.x, e.y, e.z));
  }

  // Proximity stream: true = near (phone against head).
  // proximity_sensor emits 0 when near, positive value when far.
  static Stream<bool> get proximityStream {
    if (kIsWeb) return const Stream.empty();
    return ProximitySensor.events.map((val) => val == 0);
  }
}
