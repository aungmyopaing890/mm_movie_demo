import 'package:flutter/material.dart';

import '../../screen/app_loading/view/app_loading_screen.dart';
import '../../screen/dashboard/view/dashboard_view.dart';
import 'route_paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const AppLoadingView();
      });

    case RoutePaths.home:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.home),
          builder: (BuildContext context) {
            return const DashboardView();
          });
    default:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const AppLoadingView());
  }
}
