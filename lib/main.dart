import 'package:flutter/material.dart';
import 'package:ulangan_menghitungbalok_arsyawildandaneswara/scaffold_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halo Guys',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 77, 27, 108)),
          useMaterial3: true,
        ),
        home: ScaffoldWidget());
  }
}
