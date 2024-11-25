import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2_animals/model/animalView.dart';
import 'package:task_2_animals/provider/animalProvider.dart'; // Add this package to pubspec.yaml

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AnimalProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimalViewer(),
    );
  }
}
