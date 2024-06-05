import 'package:choison_shaju/api2/api2controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api2page extends StatefulWidget {
  const Api2page({super.key});

  @override
  State<Api2page> createState() => _Api2pageState();
}

class _Api2pageState extends State<Api2page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi2data();
  }

  getapi2data() async {
    await Provider.of<Api2>(context, listen: false).fetchapidata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var api2 = Provider.of<Api2>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("JEZT"),
        centerTitle: true,
      ),
      body: api2.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: api2.api2articles?.length,
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
                              api2.api2articles?[index].urlToImage ??
                                  "NO IMAGE"),
                        ),
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      api2.api2articles?[index].title ?? "",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      maxLines: 10,
                      api2.api2articles?[index].description ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
            ),
    );
  }
}
