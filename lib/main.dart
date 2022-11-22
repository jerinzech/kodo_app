import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kodo_app/screens/folderpage.dart';

import 'screens/homepage.dart';

void main() async {
  // initialise hive instance
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');
  // var appBox = await Hive.openBox('userSettings');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KODO',
      // home: SafeArea(child: HomePage()),
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
