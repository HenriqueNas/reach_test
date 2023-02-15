import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/modules/app_module.dart';
import 'src/modules/total_reach_app.dart';

void main() async {
  await dotenv.load();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const TotalReachApp(),
    ),
  );
}
