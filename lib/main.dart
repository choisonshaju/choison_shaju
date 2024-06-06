import 'package:choison_shaju/Person/person_controller.dart';

import 'package:choison_shaju/news/newscontroller.dart';
import 'package:choison_shaju/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => New(),
        ),
        ChangeNotifierProvider(
          create: (context) => Person(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
