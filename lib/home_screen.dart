import 'package:choison_shaju/Person/Person_page.dart';
import 'package:choison_shaju/constant/colorconstant.dart';

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
      backgroundColor: Colorconstant.bgcolor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("JEZT"),
        centerTitle: true,
      ),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Person_page(),
                ),
              ),
              child: Text("PERSON"),
            ),
          ],
        ),
      ),
    );
  }
}
