import 'package:flutter_modular/flutter_modular.dart';

import '../core/named_routes.dart';
import 'home/presenter/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          NamedRoutes.home,
          child: HomePage.fromModule(),
        ),
      ];
}
