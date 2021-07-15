import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/modules.dart';
import 'shared/constants/constants.dart';
import 'shared/repositories/repositories.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => NoteRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Journal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.kSplash,
        routes: {
          AppRoutes.kSplash: (context) => SplashPage(),
          AppRoutes.kHome: (context) => HomePage(),
          AppRoutes.kNotes: (context) => EditNotePage(),
        },
      ),
    );
  }
}
