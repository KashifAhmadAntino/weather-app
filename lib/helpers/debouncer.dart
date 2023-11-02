import 'dart:async';

import 'package:flutter/material.dart';

class DeBouncer {
  final int seconds;
  Timer? _timer;

  DeBouncer({required this.seconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: seconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
