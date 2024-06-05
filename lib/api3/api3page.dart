import 'package:choison_shaju/api3/api3controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api3page extends StatefulWidget {
  const Api3page({super.key});

  @override
  State<Api3page> createState() => _Api3pageState();
}

class _Api3pageState extends State<Api3page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await Provider.of<Api3>(context, listen: true).fetchapidata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var api3 = Provider.of<Api3>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("API3 PAGE"),
        centerTitle: true,
      ),
      body: api3.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: api3.api3articles?.length,
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
                              api3.api3articles?[index].urlToImage ?? ""),
                        ),
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      api3.api3articles?[index].title ?? "",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      maxLines: 10,
                      api3.api3articles?[index].description ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
            ),
    );
  }
}
