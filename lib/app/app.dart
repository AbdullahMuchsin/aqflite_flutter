import 'package:flutter/material.dart';
import 'package:learn_sqflite/presentation/viewmodels/note_viewmodel.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteViewModel()),
      ],
      child: MaterialApp(
        title: 'My MVVM App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
