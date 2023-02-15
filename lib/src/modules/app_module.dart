import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'total_reach_app.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const TotalReachApp()),
      ];
}
