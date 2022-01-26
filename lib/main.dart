import 'package:emf_calculator/models/magnitudeProder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MagnitudeProvider>(
          create: (context) {
            return MagnitudeProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EMF-CALCULATE',
        theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.grey,
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
