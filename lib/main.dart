import 'package:flutter/material.dart';

import 'screens/tasks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tasks App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TasksScreen(),
    );
  }
}
