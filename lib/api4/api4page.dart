import 'package:choison_shaju/api4/api4controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api4page extends StatefulWidget {
  const Api4page({super.key});

  @override
  State<Api4page> createState() => _Api4pageState();
}

class _Api4pageState extends State<Api4page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await Provider.of<Api4>(context, listen: true).fetchapidata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var api4 = Provider.of<Api4>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("API4 PAGE"),
        centerTitle: true,
      ),
      body: api4.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: api4.api4articles?.length,
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
                              api4.api4articles?[index].urlToImage ?? ""),
                        ),
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      api4.api4articles?[index].title ?? "",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      maxLines: 10,
                      api4.api4articles?[index].description ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
            ),
    );
  }
}
