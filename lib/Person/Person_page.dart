import 'package:choison_shaju/Person/person_controller.dart';

import 'package:choison_shaju/constant/colorconstant.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person_page extends StatefulWidget {
  const Person_page({super.key});

  @override
  State<Person_page> createState() => _Person_pageState();
}

class _Person_pageState extends State<Person_page> {
  @override
  void initState() {
    super.initState();
    getapi2data();
  }

  getapi2data() async {
    await Provider.of<Person>(context, listen: false).fetchapidata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var personprovider = Provider.of<Person>(context);
    return Scaffold(
      backgroundColor: Colorconstant.bgcolor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("PERSON"),
        centerTitle: true,
      ),
      body: personprovider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: personprovider.personarticles?.length,
              itemBuilder: (context, index) => Container(
                  child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              personprovider.personarticles?[index].avatar ??
                                  ""),
                        ),
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      personprovider.personarticles?[index].firstName ?? "",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      maxLines: 10,
                      personprovider.personarticles?[index].email ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
            ),
    );
  }
}
