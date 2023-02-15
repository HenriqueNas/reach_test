import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reach_test/src/modules/app_module.dart';
import 'package:reach_test/src/modules/total_reach_app.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const TotalReachApp(),
    ),
  );
}
