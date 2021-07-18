import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../../modules/modules.dart';
import '../widgets/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.kSplash:
        return MaterialPageRoute(builder: (_) => SplashPage());

      case AppRoutes.kHome:
        return MaterialPageRoute(builder: (_) => HomePage());

      case AppRoutes.kNoteDetails:
        return MaterialPageRoute(builder: (_) => EditNotePage(id: args is String ? args : null));

      default:
        return MaterialPageRoute(builder: (_) => NotFoundWidget());
    }
  }
}
