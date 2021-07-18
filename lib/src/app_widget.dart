import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/modules.dart';
import 'shared/config/config.dart';
import 'shared/repositories/repositories.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NoteRepository>(create: (context) => NoteRepository()),
        ChangeNotifierProvider(create: (context) => HomeController(context.read<NoteRepository>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Journal',
        onGenerateInitialRoutes: (route) => [
          MaterialPageRoute(builder: (_) => SplashPage()),
        ],
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
