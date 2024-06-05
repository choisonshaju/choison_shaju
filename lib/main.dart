import 'package:choison_shaju/api2/api2controller.dart';
import 'package:choison_shaju/api3/api3controller.dart';
import 'package:choison_shaju/api4/api4controller.dart';
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
          create: (context) => news(),
        ),
        ChangeNotifierProvider(
          create: (context) => Api2(),
        ),
        ChangeNotifierProvider(
          create: (context) => Api3(),
        ),
        ChangeNotifierProvider(
          create: (context) => Api4(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
