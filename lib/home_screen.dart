import 'package:choison_shaju/api2/api2controller.dart';
import 'package:choison_shaju/api2/api2page.dart';
import 'package:choison_shaju/news/newspage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Newspage(),
                ),
              ),
              child: Text("NEWS"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Api2page(),
                ),
              ),
              child: Text("api2"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Api2page(),
                ),
              ),
              child: Text("api3"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Api2page(),
                ),
              ),
              child: Text("api4"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Api2page(),
                ),
              ),
              child: Text("api5"),
            ),
          ],
        ),
      ),
    );
  }
}
